import React, { Component } from 'react';
import {View,StyleSheet} from 'react-native';
import Icon from 'react-native-vector-icons/FontAwesome';
import {Input} from 'react-native-elements';

class Inputs extends Component{
    state = {isFocused: false};
    onFocusChange = () => {
        this.setState({isFocused: true})
    }
    render(){
        return(  
            <View style={[styles.container]}>
            <Input
                placeholder={this.props.name}
                onFocus={this.onFocusChange}
                inputContainerStyle={styles.inputContainer}
                inputStyle={styles.inputText}
                secureTextEntry={this.props.pass}
                onChangeText={this.props.handleText}
                leftIcon = {
                    <Icon
                        name={this.props.icon}
                        size={20}
                        color={this.state.isFocused}
                    />
                }
            />

            </View>   
        );
    };
}

const styles = StyleSheet.create({
    container: {
        width: '80%',
        height: 45,
        marginVertical: 8,
    }
});

export default Inputs;