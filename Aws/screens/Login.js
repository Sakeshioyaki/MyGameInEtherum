import React, { useState, useEffect} from 'react';
import {View, Text, Image, ScrollView, StyleSheet} from 'react-native';
import Inputs from '../components/Input';
import Submit from '../components/Submit';
import Account from '../components/Account';
import SignUp from './SignUp';
import { color } from 'react-native-reanimated';

const pressLogin = (email, pass) => {
    return fetch('http:// 192.168.0.102:8001/login', {
        method: 'POST',
        headers: {
          Accept: 'application/json',
          'Content-Type': 'application/json'
        },
        body: JSON.stringify({
            email: email,
            password: pass,
        })
      })    
      .then((response) => response.json())
      .then((json) => {
        console.log(json);
        if(json.login=="OK"){
            console.log("OK....");
        }
      })
      .catch((error) => {
        console.error(error);
      });
};

const Login = props =>{
    const [email, setEmail] = useState('');
    const [password, setPassword] = useState('');
    return( 
        <ScrollView style={{BackgroundColor:'white'}}>
            <View style={styles.container}>
                <Image source={require('../assets/imgs/login.png')} resizeMode='center' style={styles.image }></Image>
                <Text style={styles.textTitle}>Wellcome back</Text>
                <Text style={styles.textBody}>Login to your acccount</Text>
                <View style={{marginTop: 15}}/>
                <Inputs name="Email" icon="user" value='' handleText={setEmail}/>
                <Inputs name="Password" icon="lock" pass={true} handleText={setPassword}/>
                <View style={{marginTop:5}}/>
                <View style={{width:'90%'}}>
                    <Text style={[styles.textBody, 
                        {alignSelf:'flex-end'}]}>Forgot your password ? </Text>
                </View>
                <View style={{marginTop:10}}/>
                <Submit title='LOGIN' color='#5b21cf' email={email} password={password} press={pressLogin}/>
                <Text style={styles.textBody}>Or connect using</Text>
                <View style={{flexDirection: 'row'}}>
                    <Account color="#3b5c8f" icon="facebook-square" title="Facebook"/>
                    <Account color="#ec482f" icon="google" title="Google"/>
                </View>
                <Text style={[styles.textBody, {alignSelf: 'center'}]}> or Already have an account</Text>
                <Text style={[styles.textBody, {color:'blue'}, {fontWeight: 'bold'}]} 
                        onPress={() => props.navigation.navigate('SignUp')}> SignUp</Text>
            </View>
         </ScrollView>

    );
};

const styles = StyleSheet.create({
    container: {
        flex:1,
        alignItems: 'center',
        justifyContent: 'center',
    },
    image:{
        width:600,
        height: 250,
        marginVertical: -1,
    },
    textTitle:{
        fontFamily: 'Foundation',
        fontSize: 28,
        marginVertical: 4,
    },
    textBody: {
        fontFamily: 'Foundation',
        fontSize: 13,
        color: 'gray'
    }
});

export default Login;