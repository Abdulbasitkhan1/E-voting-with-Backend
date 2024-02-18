const express = require('express');
const mongoose = require('mongoose');
const bodyParser = require('body-parser');
const cors = require('cors');

const app = express();
const port = 5000;
const hostname='192.168.0.105';// '192.168.0.107';//your pc ip

mongoose.connect('mongodb://localhost:27017/EVoting', { useNewUrlParser: true, useUnifiedTopology: true });

const voterSchema = new mongoose.Schema({

  First_Name: {
    type:String,
    // required:true,
  },
  Last_Name: String,
  Cnic: { type: String, unique: true },
  Phone_No: String,
  E_Mail: String,
  Password: String,
});

const candidateSchema = new mongoose.Schema({

  First_Name: {
    type:String,
    // required:true,
  },
  Last_Name: String,
  Cnic: { type: String, unique: true },
  Phone_No: String,
  E_Mail: String,
  Password: String,
});

const adminSchema = new mongoose.Schema({

  First_Name: {
    type:String,
    // required:true,
  },
  Last_Name: String,
  Cnic: { type: String, unique: true },
  Phone_No: String,
  E_Mail: String,
  Password: String,
});

const VoterModel = mongoose.model('Voters', voterSchema);
const CandidateModel = mongoose.model('Candidates', candidateSchema);
const AdminModel = mongoose.model('Admins', adminSchema);


app.use(bodyParser.json());
app.use(bodyParser.urlencoded({ extended: true }));
app.use(cors());


// Endpoint to insert voter data
app.post('/api/insertVoter', async (req, res) => {
  try {
    const { First_Name, Last_Name, Cnic, Phone_No, E_Mail, Password } = req.body;

    // Check if the provided CNIC already exists in the database
    const existingVoter = await VoterModel.findOne({ Cnic });

    if (existingVoter) {
      return res.status(400).json({ message: 'CNIC already exists' });
    }

    // Create a new voter document using the VoterModel
    const newVoter = new VoterModel({
      First_Name,
      Last_Name,
      Cnic,
      Phone_No,
      E_Mail,
      Password,
    });

    // Save the document to the database
    await newVoter.save();

    res.status(201).json({ message: 'Voter data inserted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to insert candidate data
app.post('/api/insertCandidate', async (req, res) => {
  try {
    const { First_Name, Last_Name, Cnic, Phone_No, E_Mail, Password } = req.body;

    // Check if the provided CNIC already exists in the database
    const existingCandidate = await CandidateModel.findOne({ Cnic });

    if (existingCandidate) {
      return res.status(400).json({ message: 'CNIC already exists' });
    }

    // Create a new candidate document using the VoterModel
    const newCandidate = new CandidateModel({
      First_Name,
      Last_Name,
      Cnic,
      Phone_No,
      E_Mail,
      Password,
    });

    // Save the document to the database
    await newCandidate.save();

    res.status(201).json({ message: 'Voter data inserted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to insert admin data
app.post('/api/insertAdmin', async (req, res) => {
  try {
    const { First_Name, Last_Name, Cnic, Phone_No, E_Mail, Password } = req.body;

    // Check if the provided CNIC already exists in the database
    const existingAdmin = await AdminModel.findOne({ Cnic });

    if (existingAdmin) {
      return res.status(400).json({ message: 'CNIC already exists' });
    }

    // Create a new admin document using the VoterModel
    const newAdmin = new AdminModel({
      First_Name,
      Last_Name,
      Cnic,
      Phone_No,
      E_Mail,
      Password,
    });

    // Save the document to the database
    await newAdmin.save();

    res.status(201).json({ message: 'Voter data inserted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to delete voter data by CNIC
app.delete('/api/deleteVoter/:cnic', async (req, res) => {
    try {
      const cnic = req.params.cnic;
  
      // Check if the provided CNIC exists in the database
      const existingVoter = await VoterModel.findOne({ Cnic: cnic });
  
      if (!existingVoter) {
        return res.status(404).json({ message: 'Voter not found with the provided CNIC' });
      }
  
      // Delete the voter document by CNIC
      await VoterModel.findOneAndDelete({ Cnic: cnic });
  
      res.json({ message: 'Voter data deleted successfully' });
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });

// Endpoint to delete admin data by CNIC
app.delete('/api/deleteAdmin/:cnic', async (req, res) => {
  try {
    const cnic = req.params.cnic;

    // Check if the provided CNIC exists in the database
    const existingAdmin = await AdminModel.findOne({ Cnic: cnic });

    if (!existingAdmin) {
      return res.status(404).json({ message: 'Voter not found with the provided CNIC' });
    }

    // Delete the admin document by CNIC
    await AdminModel.findOneAndDelete({ Cnic: cnic });

    res.json({ message: 'Voter data deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint to delete candidate data by CNIC
app.delete('/api/deleteCandidate/:cnic', async (req, res) => {
  try {
    const cnic = req.params.cnic;

    // Check if the provided CNIC exists in the database
    const existingCandidate = await CandidateModel.findOne({ Cnic: cnic });

    if (!existingCandidate) {
      return res.status(404).json({ message: 'Voter not found with the provided CNIC' });
    }

    // Delete the candidate document by CNIC
    await CandidateModel.findOneAndDelete({ Cnic: cnic });

    res.json({ message: 'Voter data deleted successfully' });
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

  // Endpoint to get all voter data users
app.get('/api/getAllVoters', async (req, res) => {
    try {
      const allVoters = await VoterModel.find({}, { _id: 0, __v: 0}); // Exclude _id and __v
  
      res.json(allVoters);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });

  // Endpoint to get all voter data admins
  app.get('/api/getAllAdmins', async (req, res) => {
    try {
      const allAdmins = await AdminModel.find({}, { _id: 0, __v: 0}); // Exclude _id and __v
  
      res.json(allAdmins);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });

  // Endpoint to get all voter data candidates
  app.get('/api/getAllCandidates', async (req, res) => {
    try {
      const allCandidates = await CandidateModel.find({}, { _id: 0, __v: 0}); // Exclude _id and __v
  
      res.json(allCandidates);
    } catch (error) {
      res.status(500).json({ error: error.message });
    }
  });

// Endpoint for user login
app.post('/api/loginVoters', async (req, res) => {
  try {
      const { Cnic, E_Mail, Password } = req.body;
      console.log(req.body);
      // Find a voter with the provided credentials
      const voter = await VoterModel.findOne({ $or: [{Cnic: Cnic,Password: Password,E_Mail: E_Mail }] });
      
      console.log(voter);
    if (voter) {

      res.json({ message: 'Login successful', voter });
    } else {
      res.status(401).json({ message: 'Invalid credentials' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for candidate login
app.post('/api/loginCandidates', async (req, res) => {
  try {
    const { Cnic, E_Mail, Password } = req.body;
    console.log(req.body);
    // Find a voter with the provided credentials
    const voter = await CandidateModel.findOne({ $or: [{Cnic: Cnic,Password: Password,E_Mail: E_Mail }] });
    
    console.log(voter);
  if (voter) {

    res.json({ message: 'Login successful', voter });
  } else {
    res.status(401).json({ message: 'Invalid credentials' });
  }
} catch (error) {
  res.status(500).json({ error: error.message });
}
});

// Endpoint for admin login
app.post('/api/loginAdmins', async (req, res) => {
  try {
    const { Cnic, E_Mail, Password } = req.body;
    console.log(req.body);
    // Find a voter with the provided credentials
    const voter = await AdminModel.findOne({ $or: [{Cnic: Cnic,Password: Password,E_Mail: E_Mail }] });
    
    console.log(voter);
  if (voter) {

    res.json({ message: 'Login successful', voter });
  } else {
    res.status(401).json({ message: 'Invalid credentials' });
  }
} catch (error) {
  res.status(500).json({ error: error.message });
}
});

// Endpoint for updating Phone_No
app.put('/api/updatePhoneNoVoter', async (req, res) => {
  try {
    const { cnic, newPhoneNo } = req.body;
    console.log(cnic);
    // Update the Phone_No in the database
    const result = await VoterModel.findOneAndUpdate({ Cnic: cnic }, { $set: { Phone_No: newPhoneNo } },{new:true});
    //const result = await VoterModel.updateOne({ Cnic: cnic }, { $set: { Phone_No: newPhoneNo } });
    console.log(result.Phone_No);
    if (result.$isEmpty) {
      res.json({ message: 'Phone_No updated successfully' ,result});
    } else {
      res.status(404).json({ message: 'Voter not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.put('/api/updateEMailVoter', async (req, res) => {
  try {
    const { cnic, newEMail } = req.body;
    console.log(cnic);
    // Update the E-Mail in the database
    const result = await VoterModel.findOneAndUpdate({ Cnic: cnic }, { $set: { E_Mail: newEMail } },{new:true});

    console.log(result.E_Mail);
    if (result.$isEmpty) {
      res.json({ message: 'E-Mail updated successfully' ,result});
    } else {
      res.status(404).json({ message: 'Voter not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for updating First_Name
app.put('/api/updateFirstNameVoter', async (req, res) => {
  try {
    const { cnic, newFirstName } = req.body;
    console.log(cnic);
    // Update the First_Name in the database
    const result = await VoterModel.findOneAndUpdate({ Cnic: cnic }, { $set: { First_Name: newFirstName } },{new:true});
    console.log(result.First_Name);
    
    if (result.$isEmpty) {
      res.json({ message: 'First_Name updated successfully' , result});
    } else {
      res.status(404).json({ message: 'Voter not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for updating Last_Name
app.put('/api/updateLastNameVoter', async (req, res) => {
  try {
    const { cnic, newLastName } = req.body;

    // Update the Last_Name in the database
    const result = await VoterModel.findOneAndUpdate({ Cnic: cnic }, { $set: { Last_Name: newLastName } },{new:true});
    
    // const result = await VoterModel.updateOne({ Cnic: cnic }, { $set: { Last_Name: newLastName } });
    console.log(result.Last_Name);

    if (result.$isEmpty) {
      res.json({ message: 'Last_Name updated successfully' , result});
    } else {
      res.status(404).json({ message: 'Voter not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for updating Phone_No
app.put('/api/updatePhoneNoAdmin', async (req, res) => {
  try {
    const { cnic, newPhoneNo } = req.body;
    console.log(cnic);
    // Update the Phone_No in the database
    const result = await AdminModel.findOneAndUpdate({ Cnic: cnic }, { $set: { Phone_No: newPhoneNo } },{new:true});
    //const result = await VoterModel.updateOne({ Cnic: cnic }, { $set: { Phone_No: newPhoneNo } });
    console.log(result.Phone_No);
    if (result.$isEmpty) {
      res.json({ message: 'Phone_No updated successfully' ,result});
    } else {
      res.status(404).json({ message: 'Admin not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.put('/api/updateEMailAdmin', async (req, res) => {
  try {
    const { cnic, newEMail } = req.body;
    console.log(cnic);
    // Update the E-Mail in the database
    const result = await AdminModel.findOneAndUpdate({ Cnic: cnic }, { $set: { E_Mail: newEMail } },{new:true});

    console.log(result.E_Mail);
    if (result.$isEmpty) {
      res.json({ message: 'E-Mail updated successfully' ,result});
    } else {
      res.status(404).json({ message: 'Admin not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for updating First_Name
app.put('/api/updateFirstNameAdmin', async (req, res) => {
  try {
    const { cnic, newFirstName } = req.body;
    console.log(cnic);
    // Update the First_Name in the database
    const result = await AdminModel.findOneAndUpdate({ Cnic: cnic }, { $set: { First_Name: newFirstName } },{new:true});
    console.log(result.First_Name);
    
    if (result.$isEmpty) {
      res.json({ message: 'First_Name updated successfully' , result});
    } else {
      res.status(404).json({ message: 'Admin not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for updating Last_Name
app.put('/api/updateLastNameAdmin', async (req, res) => {
  try {
    const { cnic, newLastName } = req.body;

    // Update the Last_Name in the database
    const result = await AdminModel.findOneAndUpdate({ Cnic: cnic }, { $set: { Last_Name: newLastName } },{new:true});
    
    // const result = await VoterModel.updateOne({ Cnic: cnic }, { $set: { Last_Name: newLastName } });
    console.log(result.Last_Name);

    if (result.$isEmpty) {
      res.json({ message: 'Last_Name updated successfully' , result});
    } else {
      res.status(404).json({ message: 'Admin not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});


// Endpoint for updating Phone_No
app.put('/api/updatePhoneNoCandidate', async (req, res) => {
  try {
    const { cnic, newPhoneNo } = req.body;
    console.log(cnic);
    // Update the Phone_No in the database
    const result = await CandidateModel.findOneAndUpdate({ Cnic: cnic }, { $set: { Phone_No: newPhoneNo } },{new:true});
    //const result = await VoterModel.updateOne({ Cnic: cnic }, { $set: { Phone_No: newPhoneNo } });
    console.log(result.Phone_No);
    if (result.$isEmpty) {
      res.json({ message: 'Phone_No updated successfully' ,result});
    } else {
      res.status(404).json({ message: 'Candidate not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

app.put('/api/updateEMailCandidate', async (req, res) => {
  try {
    const { cnic, newEMail } = req.body;
    console.log(cnic);
    // Update the E-Mail in the database
    const result = await CandidateModel.findOneAndUpdate({ Cnic: cnic }, { $set: { E_Mail: newEMail } },{new:true});

    console.log(result.E_Mail);
    if (result.$isEmpty) {
      res.json({ message: 'E-Mail updated successfully' ,result});
    } else {
      res.status(404).json({ message: 'Candidate not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for updating First_Name
app.put('/api/updateFirstNameCandidate', async (req, res) => {
  try {
    const { cnic, newFirstName } = req.body;
    console.log(cnic);
    // Update the First_Name in the database
    const result = await CandidateModel.findOneAndUpdate({ Cnic: cnic }, { $set: { First_Name: newFirstName } },{new:true});
    console.log(result.First_Name);
    
    if (result.$isEmpty) {
      res.json({ message: 'First_Name updated successfully' , result});
    } else {
      res.status(404).json({ message: 'Candidate not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

// Endpoint for updating Last_Name
app.put('/api/updateLastNameCandidate', async (req, res) => {
  try {
    const { cnic, newLastName } = req.body;

    // Update the Last_Name in the database
    const result = await CandidateModel.findOneAndUpdate({ Cnic: cnic }, { $set: { Last_Name: newLastName } },{new:true});
    
    // const result = await VoterModel.updateOne({ Cnic: cnic }, { $set: { Last_Name: newLastName } });
    console.log(result.Last_Name);

    if (result.$isEmpty) {
      res.json({ message: 'Last_Name updated successfully' , result});
    } else {
      res.status(404).json({ message: 'Candidate not found with the provided CNIC' });
    }
  } catch (error) {
    res.status(500).json({ error: error.message });
  }
});

  app.listen(port,hostname,()=>{

    console.log('server is up http://${hostname}:${port}');

});