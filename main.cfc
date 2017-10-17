<!---
  --- main
  --- ----
  ---
  --- author: anants
  --- date:   10/10/17
  --->
<cfcomponent output="false">
<cffunction name="getDishes" access="remote" output="false" returnformat="JSON">
        <!--- <cfargument name="nom" required="true" type="string" /> --->
		<cfquery datasource="myDataSource" name="dish_details">
			select * from dish_details
		</cfquery>
		<cfset dishArray = [] />
		<cfloop query="dish_details">
			    <cfset dish = {"dish_id" = dish_details.dish_id ,
						       "dish_name" = dish_details.dish_name ,
						       "details"  = dish_details.details ,
						       "price" = dish_details.price ,
						       "dish_for" = dish_details.dish_for ,
						       "type" = dish_details.type,
						       "image" = dish_details.image
						       }/>
				<cfset arrayAppend(dishArray, dish)>
				<cfset result={"dishes" = dishArray} >
		</cfloop>
		<cfreturn result />
    </cffunction>

	<cffunction name="getDishById" access="remote" output="false" returnformat="JSON">
        <cfargument name="id" required="true" type="int" />
		<cfquery datasource="myDataSource" name="dish_detail">
			select * from dish_details where dish_id = <cfqueryparam value="#id#"/>
		</cfquery>
			    <cfset dish = {"dish_id" = dish_detail.dish_id ,
						       "dish_name" = dish_detail.dish_name ,
						       "details"  = dish_detail.details ,
						       "price" = dish_detail.price ,
						       "dish_for" = dish_detail.dish_for ,
						       "type" = dish_detail.type,
						       "image" = dish_detail.image
						       }/>
		<cfreturn dish />
    </cffunction>

	<cffunction name="getUserByEmail" access="remote" output="false" returnformat="JSON">
        <cfargument name="email" required="true" type="string" />
		<cfquery datasource="myDataSource" name="user_detail">
			select * from user_details where email = <cfqueryparam value="#email#"/>
		</cfquery>
		<cfif user_detail.recordcount GT 0>
			    <cfset result = {"status" = "successful" ,
								"message" = "Record Found",
								"user_id" = user_detail.user_id ,
						       "name" = user_detail.name ,
						       "email"  = user_detail.email ,
						       "contact" = user_detail.contact ,
						       "address" = user_detail.address
						       }/>
						       <cfelse>
			<cfset result = {"status" = "unsuccessful" ,
							 "message" = "No Record Found",
						     "user_id" = user_detail.user_id
						    }/>
			</cfif>
		<cfreturn result  />
    </cffunction>

	<cffunction name="userCheck" access="remote" output="false" returnformat="JSON">
		<cfargument name="name" required="true" type="string" />
        <cfargument name="email" required="true" type="string" />
		<cfargument name="contact" required="true" type="string" />
		<cfargument name="address" required="true" type="string" />
		<cfset user_name ="#name#">
		<cfset user_address="#address#">

		<cfquery datasource="myDataSource" name="user_detail" result="output">
			select * from user_details where email = <cfqueryparam value="#email#"/>
		</cfquery>
		<cfif user_detail.recordcount GT 0>
			<cfif user_name EQ user_detail.name AND user_address EQ user_detail.address >
				<cfset result = {"status" = "successful" ,
								 "message" = "Record Found",
							     "user_id" = user_detail.user_id
							    }/>
			<cfelse>
				<cfquery datasource="myDataSource" name="user_detail">
						UPDATE user_details SET name = <cfqueryparam value="#name#"/> , address = <cfqueryparam value="#address#"/>  where email = <cfqueryparam value="#email#"/>
				</cfquery>
				<cfset result = {"status" = "successful" ,
								 "message" = "Record Updated",
							     "user_id" = user_detail.user_id
							}/>
			</cfif>

		<cfelse>
				<cfquery datasource="myDataSource" name="user_detail">
						INSERT INTO user_details (name, email, contact,address) VALUES (<cfqueryparam value="#name#"/>,<cfqueryparam value="#email#"/>,<cfqueryparam value="#contact#"/>,<cfqueryparam value="#address#"/> )
				</cfquery>
				<cfquery datasource="myDataSource" name="user_detail">
						select * from user_details where email = <cfqueryparam value="#email#"/>
				</cfquery>
				<cfset result = {"status" = "successful" ,
								 "message" = "Record Created",
							       "user_id" = user_detail.user_id
							    }/>
		</cfif>
		<cfreturn result />
    </cffunction>

	<cffunction name="placeOrder" access="remote" output="false" returnformat="JSON">
        <cfargument name="user_id" required="true" type="int" />
		 <cfargument name="dish_id" required="true" type="int" />
		<cfquery datasource="myDataSource" name="placedOrder" result="result">
			INSERT INTO order_details (dish_id, user_id) VALUES (<cfqueryparam value="#dish_id#"/>,<cfqueryparam value="#user_id#"/>)
		</cfquery>


			    <cfset result = {"status" = "successful" ,
								"message" = "Order Placed",
								"order_id" = result.GENERATEDKEY
						       }/>

		<cfreturn result  />
    </cffunction>

</cfcomponent>


