import React, { useState } from 'react';
import { View, Text, FlatList, TouchableOpacity, StyleSheet } from 'react-native';
import { initialUsers } from '../data/data.jsx';

export default function LoginScreen({ navigation }) {
    const [users] = useState(initialUsers);

    const handleUserSelect = (role) => {
        // Modificamos la lógica para que coincida con los roles exactos
        const screenMap = {
            'administrador': 'Admin',
            'microempresario': 'Micro',
            'vendedor': 'Vendor'
        };

        const screenName = screenMap[role];
        
        if (screenName) {
            // Usamos navigate en lugar de reset
            navigation.navigate(screenName);
        }
    };

    return (
        <View style={styles.container}>
            <Text style={styles.title}>Selecciona Usuario</Text>
            <FlatList
                data={users}
                keyExtractor={item => item.id}
                renderItem={({ item }) => (
                    <TouchableOpacity
                        style={styles.item}
                        onPress={() => handleUserSelect(item.role)}
                    >
                        <Text>{item.name} ({item.role})</Text>
                    </TouchableOpacity>
                )}
            />
        </View>
    );
}

const styles = StyleSheet.create({
    container: { 
      flex: 1, 
      padding: 20 
    },
    title: {
      fontSize: 18, 
      marginBottom: 10
    },
    item: {
      padding: 15,
      borderBottomWidth: 1
    },
  });
