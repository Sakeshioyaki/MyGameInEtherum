import React from 'react';
import {StyleSheet, TouchableOpacity, Text} from 'react-native';
import {Button} from 'react-native-elements';
import Icon from 'react-native-vector-icons/FontAwesome';

const Account = props => {
    return (
        <TouchableOpacity style={[styles.container, {backgroundColor: props.color}]}>
            <Icon style={styles.accIcon} name={props.icon}/>
            <Text style={styles.textTitle}>{props.title}</Text>
        </TouchableOpacity>
    );

};

const styles = StyleSheet.create({
    container:{
        flexDirection: 'row',
        width: 120,
        height: 35,
        marginHorizontal: 10,
        marginVertical: 10,
        borderRadius: 5
    },
    accIcon:{
        color: 'white',
        fontSize: 15,
        marginVertical: 10,
        marginHorizontal: 10,
    },
    textTitle: {
        color: 'white',
        fontWeight: 'bold',
        fontSize:13,
        marginVertical: 10, 
        marginHorizontal: 7
    }
});

export default Account;