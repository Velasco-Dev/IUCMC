import React, { useState } from 'react';
import { View, Text, FlatList, TouchableOpacity, TextInput, Button, Alert, StyleSheet } from 'react-native';
import { initialUsers } from '../data/data.jsx';
export default function AdminScreen() {
  const [users, setUsers] = useState(initialUsers);
  const [newName, setNewName] = useState('');
  const addUser = () => {
    if (!newName.trim()) return;
    const next = { id: `u${Date.now()}`, role: 'micro', name: newName.trim() };
    setUsers([...users, next]);
    setNewName('');
  };
  const deleteUser = id => {
    Alert.alert('Eliminar', 'Confirmar eliminación?', [
      { text: 'Cancelar' },
      { text: 'OK', onPress: () => setUsers(users.filter(u => u.id !== id)) }
    ]);
  };
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Usuarios Registrados</Text>
      <FlatList
        data={users}
        keyExtractor={u => u.id}
        renderItem={({ item }) => (
          <View style={styles.row}>
            <Text>{item.name} [{item.role}]</Text>
            <TouchableOpacity onPress={() => deleteUser(item.id)}>
              <Text style={{color:'red'}}>Eliminar</Text>
            </TouchableOpacity>
          </View>
        )}
      />
      <TextInput placeholder="Nuevo microempresario" value={newName} onChangeText={setNewName} style={styles.input} />
      <Button title="Agregar" onPress={addUser} />
    </View>
  );
}
const styles = StyleSheet.create({ container:{flex:1,padding:20}, title:{fontSize:18,marginBottom:10}, row:{flexDirection:'row',justifyContent:'space-between',padding:10,borderBottomWidth:1}, input:{borderWidth:1,padding:8,marginVertical:10} });
