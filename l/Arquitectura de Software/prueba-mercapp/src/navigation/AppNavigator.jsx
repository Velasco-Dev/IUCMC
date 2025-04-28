import React from 'react';
import { createStackNavigator } from '@react-navigation/stack';
import LoginScreen from '../screens/LoginScreen';
import AdminScreen from '../screens/AdminScreen';
import MicroScreen from '../screens/MicroScreen';
import VendedorScreen from '../screens/VendedorScreen';
import BackButton from '../components/common/BackButton';
import LogoutButton from '../components/common/LogoutButton';

const Stack = createStackNavigator();

const screenOptions = {
    headerLeft: () => <BackButton />,
    headerRight: () => <LogoutButton />,
    headerStyle: {
        elevation: 0, // Android
        shadowOpacity: 0, // iOS
        backgroundColor: '#fff'
    },
    headerTitleStyle: {
        fontWeight: 'bold',
    },
    headerTintColor: '#000',
    headerTitleAlign: 'center',
};
export default function AppNavigator() {
    return (
        <Stack.Navigator initialRouteName="Login" screenOptions={{...screenOptions, headerMode: 'screen'}}>
            <Stack.Screen name="Login" component={LoginScreen} options={{ title: 'Inicio de Sesión', headerLeft: null, headerRight: null  }} />
            <Stack.Screen name="Admin" component={AdminScreen} options={{ title: 'Administrador@' }} />
            <Stack.Screen name="Micro" component={MicroScreen} options={{ title: 'Microempresari@' }} />
            <Stack.Screen name="Vendor" component={VendedorScreen} options={{ title: 'Vendedor@' }} />
        </Stack.Navigator>
    );
}