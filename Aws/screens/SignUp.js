import React from 'react';
import {View, Text, ScrollView, Image,StyleSheet} from 'react-native';
import { color } from 'react-native-reanimated';
import Inputs from '../components/Input';
import Input  from '../components/Input';
import Submit  from '../components/Submit';

const SignUp = props =>{
    return(
        <ScrollView style={{backgroundColor: 'white'}}>
            <View style={styles.container}>
            <Image source ={require('../assets/imgs/signup.png')}
                resizeMode="center"
                style={styles.image}/>
            <Text style={styles.textTitle}> Let's get started</Text>
            <Text style={styles.textBody}>Create an account</Text>
            <Inputs name='Account Name' icon='user-circle'/>
            <Inputs name="Full Name" icon='user'/>
            <Inputs name='Email' icon='envelope'/>
            <Inputs name='Phone' icon='phone'/>
            <Inputs name='Password' icon='lock' pass={true}/>
            <Inputs name='Cofirm Password' icon='lock' pass={true}/>
            <View style={{marginTop: 5 }}/>
            <Submit color='#0251ce' title='CREAT'/>
            <View style={{flexDirection: 'row'}}>
                <Text style={[styles.textBody,{color: 'gray'}]}>Already have an account</Text>
                <Text style={[styles.textBody, {color: 'blue'}, {fontWeight: 'bold'}]} onPress ={
                    () => {
                        props.navigation.navigate('Home')
                    }
                }> Login Here</Text>
            </View>
            </View>
        </ScrollView> 
    ); 
};

const styles = StyleSheet.create({
    container:{
        flex: 1,
        alignItems:'center',
    },
    image: {
        width:250,
        height: 200,
        marginVertical: 0,
    },
    textTitle:{
        fontSize:25,
        fontFamily: 'Foundation',
        marginVertical: 2,

    },
    textBody:{
        fontSize: 16,
        fontFamily: 'Foundation',
        marginVertical: 3,

    }
});

export default SignUp;