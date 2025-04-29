import React, { useState } from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet, TextInput, Button, ScrollView, KeyboardAvoidingView, Platform } from 'react-native';
import { initialUsers } from '../data/data.jsx';
import CustomAlert from '../components/common/CustomAlert.jsx';

export default function LoginScreen({ navigation }) {

    const [users] = useState(initialUsers);

    const [userName, setUserName] = useState('');
    const [userPassword, setUserPassword] = useState('');

    const [alertVisible, setAlertVisible] = useState(false);
    const [alertMessage, setAlertMessage] = useState('');
    const [alertTitle, setAlertTitle] = useState('');

    const showAlert = (title, message) => {
        setAlertTitle(title);
        setAlertMessage(message);
        setAlertVisible(true);
    };

    const validateUser = () => {

        // Validar que los campos no estén vacíos
        if (!userName || !userPassword) {
            showAlert('Error', 'Por favor ingrese usuario y contraseña');
            return;
        }

        console.log('Intentando login con:', userName, userPassword);
        console.log('Usuarios disponibles:', users);
        // Buscamos el usuario en la lista de usuarios
        // Usamos find para buscar el usuario que coincida con el nombre y la contraseña
        const user = users.find(
            u => u.user === userName && u.password === userPassword
        );

        console.log('Usuario encontrado:', user);

        if (user) {
            // Si el usuario existe, navegamos a la pantalla correspondiente
            const screenMap = {
                'administrador': 'Admin',
                'microempresario': 'Micro',
                'vendedor': 'Vendor'
            };

            const screenName = screenMap[user.role];

            if (screenName) {
                navigation.navigate(screenName);
                // Limpiamos los campos
                setUserName('');
                setUserPassword('');
            }
        } else {
            showAlert('Error de acceso', 'Usuario o contraseña incorrectos');
            setUserPassword('');
        }
    };

    return (

        <KeyboardAvoidingView
            behavior={Platform.OS === "ios" ? "padding" : "height"}
            style={{ flex: 1 }}
        >
            <ScrollView contentContainerStyle={styles.scrollContainer} keyboardShouldPersistTaps="handled">
                <View style={styles.container}>
                    <View style={styles.loginForm}>
                        <Text style={styles.title}>Iniciar Sesión</Text>
                        <TextInput
                            autoCapitalize="none"
                            placeholder="Usuario"
                            value={userName}
                            onChangeText={text => setUserName(text)}
                            style={styles.input}
                        />
                        <TextInput
                            secureTextEntry
                            autoCapitalize="none"
                            placeholder="Contraseña"
                            value={userPassword}
                            onChangeText={text => setUserPassword(text)}
                            style={styles.input}
                        />
                        <Button
                            title="Ingresar"
                            onPress={validateUser}
                        />
                    </View>
                    <CustomAlert
                        visible={alertVisible}
                        title={alertTitle}
                        message={alertMessage}
                        onClose={() => setAlertVisible(false)}
                    />
                </View>
            </ScrollView>
        </KeyboardAvoidingView>

        // {/*<View style={styles.container}>
        //     <Text style={styles.title}>Selecciona Usuario</Text>
        //     <FlatList
        //         data={users}
        //         keyExtractor={item => item.id}
        //         renderItem={({ item }) => (
        //             <TouchableOpacity
        //                 style={styles.item}
        //                 onPress={() => handleUserSelect(item.role)}
        //             >
        //                 <Text>{item.name} ({item.role})</Text>
        //             </TouchableOpacity>
        //         )}
        //     /> 
        // </View>*/}
    );
}

const styles = StyleSheet.create({


    buttonContainer: {
        width: '100%',
        marginTop: 20,
    },
    scrollContainer: {
        flexGrow: 1,
        justifyContent: 'flex-start',
    },
    container: {
        flex: 1,
        justifyContent: 'center',
        padding: 40,
        backgroundColor: '#fff',
    },
    loginForm: {
        width: '100%',
        alignItems: 'center',
        borderRadius: 10,
        borderColor: '#ddd',
        borderWidth: 2,
        padding: 20,
        boxShadow: '0 4px 8px rgba(0,0,0,0.2)',
    },
    title: {
        fontSize: 24,
        marginBottom: 20,
        fontWeight: 'bold'
    },
    input: {
        borderWidth: 1,
        borderColor: '#ddd',
        padding: 10,
        marginVertical: 10,
        borderRadius: 5,
        width: '100%'
    }
});
