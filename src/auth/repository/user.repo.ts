import { DeepPartial, EntityRepository, Repository } from "typeorm"
import { User } from "../entity/user.entity";
import {Request,Response } from "express";
import jwt from "jsonwebtoken";

@EntityRepository(User)
export class UserRepository extends Repository<User>{
    //Get User
    async fetchUser(req:any,res:Response){
        const Btoken = req.headers["authorization"];
        if (typeof Btoken !== undefined ){
            req.token = Btoken;
            jwt.verify(req.token,"key",
                async (error: any, authData: any) => {
                    if(error){
                        res.send(error);
                    }else{
                        let data = await this.createQueryBuilder("user")
                            .select()
                            .getMany();
                        res.send(data);
                    }
                }
            )
        }
    }

    //Create a new user
    async createUser(req:Request,res:Response){

        const{username,useremail,userpassword} = req.body

        try{           
            let user = new User()
            user.username = username;
            user.useremail = useremail;
            user.userpassword = userpassword;
    
            let userData = await this.save(user);

            let userId = await this.createQueryBuilder("user")
                .select("user.id")
                .getOne();
            var token = jwt.sign({id:userId},"key",{
                expiresIn :9999,
                
            });
            console.log(token);

            return res.send({
                authentication:true, 
                token:token
            });

        }catch(error){
            res.send(error);
        }
    }

    //DELETE USER
    async deleteUser(req:Request,res:Response){

        const{ username } = req.body

        try{           
          let data = await this.createQueryBuilder("user")
              .where("username = :query",{query: username})
              .delete()
              .execute();
    
          return res.send(data); 
        }catch(error){
          console.log(error);
          res.send(error);
        }
    }

    async updateUser(req:Request,res:Response){

        const{ username,userpassword,id } = req.body

        try{           
          let data = await this.createQueryBuilder("user")
              .update(User)
              .set({
                //   username:username,
                //   useremail:useremail,
                userpassword : userpassword
              })
              .where("username = :username",{username: username})
              .execute();
    
          return res.send(data); 
        }catch(error){
          console.log(error);
          res.send(error);
        }
    }
}
