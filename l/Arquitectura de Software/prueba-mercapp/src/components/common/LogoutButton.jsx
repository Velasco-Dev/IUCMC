import React from 'react';
import { TouchableOpacity, Text, StyleSheet } from 'react-native';
import { useNavigation } from '@react-navigation/native';

const LogoutButton = () => {
    const navigation = useNavigation();

    const handleLogout = () => {
        navigation.reset({
            index: 0,
            routes: [{ name: 'Login' }],
        });
    };

    return (
        <TouchableOpacity 
            style={styles.headerButton}
            onPress={handleLogout}
        >
            <Text style={styles.headerButtonText}>Cerrar Sesión</Text>
        </TouchableOpacity>
    );
};

const styles = StyleSheet.create({
    headerButton: {
        marginRight: 15,
        padding: 8,
    },
    headerButtonText: {
        fontSize: 16,
        color: '#FF0000',
    }
});

export default LogoutButton;