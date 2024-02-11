import React, { useReducer } from 'react';
import axios from 'axios';

export default function AddTrekk(){
const initialState = {
  successMsg: '',
};

function reducer(state, action) {
  switch (action.type) {
    case 'SET_SUCCESS_MSG':
      return { ...state, successMsg: action.payload };
    default:
      return state;
  }
}

  const [state, dispatch] = useReducer(reducer, initialState);

  const [trekData, setTrekData] = useState({
    trekName: '',
    trekkingPoint: '',
    landmark: '',
    pincode: '',
    date: '',
    offer: '',
    charges: '',
    guideName: '',
  });

  const handleSubmit = (e) => {
    e.preventDefault();

    // Validate the fields using regular expressions
    const nameRegex = /^[a-zA-Z ]{2,30}$/;
    const pincodeRegex = /^[0-9]{6}$/;
    const chargesRegex = /^[0-9]{1,6}(\.[0-9]{1,2})?$/;

    if (!nameRegex.test(trekData.trekName)) {
      alert('Invalid Trek Name');
      return;
    }

    if (!pincodeRegex.test(trekData.pincode)) {
      alert('Invalid Pincode');
      return;
    }

    if (!chargesRegex.test(trekData.charges)) {
      alert('Invalid Charges');
      return;
    }

    // Send the data to the server
    axios.post('', trekData)
      .then(response => {
        dispatch({ type: 'SET_SUCCESS_MSG', payload: response.data.message });
      })
      .catch(error => {
        console.error('Error:', error);
      });
  }

  return (
    <form onSubmit={handleSubmit}>
      <label>
        Trek Name:
        <input type="text" value={trekData.trekName} onChange={(e) => setTrekData({ ...trekData, trekName: e.target.value })} />
      </label>
      <label>
        Trekking Point:
        <input type="text" value={trekData.trekkingPoint} onChange={(e) => setTrekData({ ...trekData, trekkingPoint: e.target.value })} />
      </label>
      <label>
        Landmark:
        <input type="text" value={trekData.landmark} onChange={(e) => setTrekData({ ...trekData, landmark: e.target.value })} />
      </label>
      <label>
        Pincode:
        <input type="text" value={trekData.pincode} onChange={(e) => setTrekData({ ...trekData, pincode: e.target.value })} />
      </label>
      <label>
        Date:
        <input type="date" value={trekData.date} onChange={(e) => setTrekData({ ...trekData, date: e.target.value })} />
      </label>
      <label>
        Offer:
        <input type="text" value={trekData.offer} onChange={(e) => setTrekData({ ...trekData, offer: e.target.value })} />
      </label>
      <label>
        Charges:
        <input type="text" value={trekData.charges} onChange={(e) => setTrekData({ ...trekData, charges: e.target.value })} />
      </label>
      <label>
        Guide Name:
        <input type="text" value={trekData.guideName} onChange={(e) => setTrekData({ ...trekData, guideName: e.target.value })} />
      </label>
      <button type="submit">Submit</button>
          <div className="col md-12 text-right">
            <input type="button" value="clear" className="btn btn-danger mt-3 me-3 "
              onClick={() => { dispatch({ type: 'reset' }) }} />
          </div>
      </form>
  )
}