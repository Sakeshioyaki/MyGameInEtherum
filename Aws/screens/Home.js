import React, { useState, useEffect} from 'react';
import {View, Text, Image, ScrollView, StyleSheet} from 'react-native';
import Inputs from '../components/Input';
import Submit from '../components/Submit';
import Account from '../components/Account';
import SignUp from './SignUp';
import { color } from 'react-native-reanimated';

const Home = props =>{
    return(
        <View>{data = props.navigation.getParam('currentUser','this is default')}</View>
    )
}

const styles = StyleSheet.create({

});

export default Home;