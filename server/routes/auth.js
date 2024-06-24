const express = require('express');
const bodyParser = require('body-parser');
const bcryptjs = require('bcryptjs');
const authRouter = express.Router();
const jwt = require('jsonwebtoken');

const app = express();
app.use(express.json());
app.use(bodyParser.json());

const User = require('../models/user');
const auth = require('../middleware/auth');

//SIGNUP
authRouter.post('/api/signup', async (req, res) => {
    try {
        const {name, email, password} = req.body; //get data from client
    
        const existingUser = await User.findOne({email});
        if(existingUser) {
            return res
                .status(400)
                .json({msg: "User with same email already exists!"});
        } //checking if user exists already

        const hashedPassword = await bcryptjs.hash(password, 8);

        let user = new User({
            email,
            password: hashedPassword,
            name,
        }) //creating a user, whose data to be manipulated in mongodb

        user = await user.save();
        res.json(user); //passing data to client

        //post data in database
        //return data to the user
    } catch (e) {
        res
            .status(500)
            .json({ error: e.message });
    }
});

//SIGNIN
authRouter.post('/api/signin', async (req, res) => {
    try {
        const {email, password} = req.body; //get data from client
    
        const reg_user = await User.findOne({email});
        if(!reg_user) {
            return res
                .status(400)
                .json({msg: "Account does not exist! Please sign up."});
        } //if entered email is unknown

        const isMatch = await bcryptjs.compare(password, reg_user.password);
        if(!isMatch) {
            return res
                .status(400)
                .json({msg: "Incorrect Password!"});
        }

        //two same passwords of different account will not be the same due to hashing
        
        const token = jwt.sign({id: reg_user._id}, "passwordKey"); //veri
        res.json({token, ...reg_user._doc});

        //returns
        // 'token' = 'abcd'
        // 'name' = 'pratiek'
        // 'email' = 'pratik@gmail.com'

    } catch (e) {
        res
            .status(500)
            .json({ error: e.message });
    }
})

//VALIDATION
authRouter.post('/tokenIsValid', async (req, res) => {
    try {
        const token = req.header('x-auth-token');
        if(!token) return res.json(false);
        const isVerified = jwt.verify(token, 'passwordKey');
        if(!isVerified) return res.json(false);
        const user = await User.findById(isVerified._id);
        if(!user) return res.json(false);
        else return res.json(true);
    } catch (e) {
        res
            .status(500)
            .json({ error: e.message });
    }
})

//get user data
authRouter.get("/", auth, async(req, res) => {
    const user = await User.findById(req.user);
    req.json({...user._doc, token: req.token });
});

module.exports = authRouter;