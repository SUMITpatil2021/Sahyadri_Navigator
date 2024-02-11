import { useReducer, useState } from "react";
import { useNavigate } from "react-router-dom";


export default function UserRegistration() {

  let Navigate = useNavigate();
  const init = {
    Name: { value: "", valid: false, touched: false, error: "" },
    Email: { value: "", valid: false, touched: false, error: "" },
    PhoneNo: { value: "", valid: false, touched: false, error: "" },
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

  const [user, dispatch] = useReducer(reducer, init);

  const userTypes = [
    { id: 1, name: 'Admin' },
    { id: 2, name: 'Trekker' },
    { id: 3, name: 'Trekking club' },
  ];

  const validateData = (key, val) => {
    let valid = false;
    let error = ""
    switch (key) {
      case 'Name':
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
      case 'Email':
        var pattern4 = /^[\w._#-]{4,20}@[\w-]{5,15}\.[a-z]{2,3}$/
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
    dispatch({ type: 'update', data: { name, value, touched: true, valid, error, formvalid } })
  }

  const handleUserTypeChange = (e) => {
    const userType = userTypes.find((type) => type.id === parseInt(e.target.value));
    setSelectedUserType(userType);
}
const [selectedUserType, setSelectedUserType] = useState(userTypes[0]);
  const [respo, saveRes] = useState("");

  const submitData = (e) => {
    e.preventDefault();
    console.log(JSON.stringify(user));

    const reqOptions = {
      method: "POST",
      headers: { 'content-type': 'application/json' },
      body: JSON.stringify({
        Name: user.Name.value,
        Email: user.Email.value,
        PhoneNo: user.PhoneNo.value,
        Username: user.Username.value,
        Password: user.Password.value,
        Roll: user.Roll.value,
      })
    }

    fetch("http://localhost:9000/register", reqOptions)
      .then(resp => resp.text())
      .then(data => saveRes(data))
    console.log(respo);
    if (respo == "User Registered") {
      Navigate('/Login')
      console.log("True")
    }
  }

  return (
    <div className="container">
      <h1 className="text-center">Registration Form</h1>
      <form className="border ">
        <div className="row mb-3 form-group mt-3">
          <div className="col mb-3 ">
            Enter Name :
            <input type="text" name="Name" id="Name" placeholder="eg. Supriya sutar" className="form-control " value={user.Name.value}
              onChange={(e) => { handleChange("Name", e.target.value) }}
              onBlur={(e) => { handleChange("Name", e.target.value) }} />
            <div style={{ display: user.Name.touched && !user.StudentName.valid ? "block" : "none" }}>
              {user.Name.error}
            </div>
          </div>
        </div>

        <div className="row mb-3 form-group mt-3">
          <div className="col mb-3">
            Enter Email:
            <input type="email" name="Email" id="Email" placeholder="eg. abc@gmail.com" className="form-control" value={user.Email.value}
              onChange={(e) => { handleChange("Email", e.target.value) }}
              onBlur={(e) => { handleChange("Email", e.target.value) }} />
            <div style={{ display: user.Email.touched && !user.Email.valid ? "block" : "none" }}>
              {user.Email.error}
            </div>
          </div>
        </div>

        <div className="row mb-3 form-group mt-3">
          <div className="col mb-3 ">
            Enter Phone No.  :
            <input type="tel" name="PhoneNo" id="PhoneNo" placeholder="eg.7447882097" className="form-control " value={user.PhoneNo.value}
              onChange={(e) => { handleChange("PhoneNo", e.target.value) }}
              onBlur={(e) => { handleChange("PhoneNo", e.target.value) }} />
            <div style={{ display: user.PhoneNo.touched && !user.PhoneNo.valid ? "block" : "none" }}>
              {user.PhoneNo.error}
            </div>
          </div>
          <div className="col mb-3">
            Enter Username:
            <input type="text" name="Username" id="Username" placeholder="eg. Supriya " className="form-control" value={user.Username.value}
              onChange={(e) => { handleChange("Username", e.target.value) }}
              onBlur={(e) => { handleChange("Username", e.target.value) }} />
          </div>
          <div className="col mb-3 ">
            Enter Password:
            <input type="text" name="Password" id="Password" placeholder="eg. Supriya@123" className="form-control " value={user.Password.value}
              onChange={(e) => { handleChange("Password", e.target.value) }}
              onBlur={(e) => { handleChange("Password", e.target.value) }} />
          </div>
          <div className="col mb-3 ">
            Select Type:
            <select value={selectedUserType.id} onChange={(e) => handleUserTypeChange(e)}>
              {userTypes.map((type) => (
                <option key={type.id} value={type.id}>
                  {type.name}
                </option>
              ))}
            </select>
          </div>
        </div>
        <div className="row mb-3 form-group mt-1">
          <div className="col mb-3">
            <input type="button" value="Submit" className="btn btn-success mt-3 me-3 "
              onClick={(e) => { submitData(e) }} />

          </div>
          <div className="col md-12 text-right">
            <input type="button" value="clear" className="btn btn-danger mt-3 me-3 "
              onClick={() => { dispatch({ type: 'reset' }) }} />
          </div>
        </div>
      </form>

    </div>
    )
}