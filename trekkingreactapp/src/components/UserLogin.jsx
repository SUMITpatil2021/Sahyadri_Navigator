import React from "react"
import { Link, useNavigate } from "react-router-dom"
import {useDispatch, useSelector }from 'react-redux'
//import StudentLogin from './StudentLogin'
import { useReducer, useState } from "react"

function UserLogin() {

  let Navigate = useNavigate();
  const init = {
    Username: { value: "", valid: false, touched: false, error: "" },
    Password: { value: "", valid: false, touched: false, error: "" },
    formValid: false,
  }
  const reducer = (state, action) => {
    switch (action.type) {
      case 'update':
        const { name, value, touched, valid, error, formvalid } = action.data
        //console.log(formvalid)
        return { ...state, [name]: { value, touched, valid, error }, formvalid }

      case 'reset':
        return init;
    }
  }

  const validateData = (key, val) => {
    let valid = false;
    let error = ""
    switch (key) {
      case 'Username':
        var pattern3 = /^[\w]+ [\w]+$/
        if (pattern3.test(val)) {
          valid = true;
          error = "";
        }
        else {
          valid = false;
          error = "Invalid"
        }
        break;
      case 'Password':
        var pattern4 = /^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!*("`'.;<=>?@[\]^_`{|}~-]).{8,32}$/
        if (pattern4.test(val)) {
          valid = true;
          error = "";
        }
        else {
          valid = false;
          error = "Invalid"
        }
        break;
    }
    return { valid, error }
  }

  const handleChange = (name, value) => {
    const { valid, error } = validateData(name, value)
    let formvalid = true;

    for (const key in user) {
      console.log(key + " : " + user[key].valid)
      if (user[key].valid === false) {
        formvalid = false;
        break;
      }
    }
    console.log(formvalid)
    dispatched({ type: 'update', data: { name, value, touched: true, valid, error, formvalid } })
  }
  
  const[stud, dispatched]=useReducer(reducer,init);
  const[respo,saveRes]=useState("");

  const submitme=(e)=>{
      e.preventDefault();

      const reqOptions={
          method:"Get",
          headers:{'content-type':'application/json'},
          body: JSON.stringify({
            userid:stud.Username,
            passwd:stud.Password
          })
      }

      fetch("http://localhost:9000/login",reqOptions)
      .then(resp=>resp.text())
      .then(data=>saveRes(data))

      if(respo == "Success"){
        Navigate('/Dashboard')
        console.log("True")
       
      }
  }

    return (
      <div>
      <div className="Auth-form-container">
      <form className="Auth-form">
        <div className="Auth-form-content">
          <h3 className="Auth-form-title">Login</h3>
          <div className="form-group mt-3">
            <label>User Name </label>
            <input
              type="text"
              className="form-control mt-1"
              placeholder="Enter User Name "
              value={stud.Username}
              onChange={(e) => { handleChange("Username", e.target.value) }}
              onBlur={(e) => { handleChange("Username", e.target.value) }}
              />
          </div>
          <div className="form-group mt-3">
            <label>Password</label>
            <input
              type="password"
              className="form-control mt-1"
              placeholder="Enter password"
              value={stud.Password}
              onChange={(e) => { handleChange("Password", e.target.value) }}
              onBlur={(e) => { handleChange("Password", e.target.value) }}
            />
          </div>
          <div className="d-grid gap-2 mt-3">
            <button type="submit" className="btn btn-primary" onClick={(e)=> {submitme(e)}}>
              Submit
            </button>
          </div>
        </div>
        <div className="signup">
                <span className="signup">Don't have an Account?
                    <Link to="/Register">Signup</Link>
                </span>
        </div>
      </form>
     
     
    </div> 
     
    <div  className="text-center  mt-0"><p style={{marginTop:"-160px"}}>{respo}</p></div>

    </div>
    
    )
}

export default UserLogin;