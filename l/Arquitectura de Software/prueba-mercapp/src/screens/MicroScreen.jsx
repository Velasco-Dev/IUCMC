import React, { useState } from 'react';
import { View, Text, FlatList, TextInput, Button, TouchableOpacity, Alert, StyleSheet } from 'react-native';
import { initialProducts } from '../data/data.jsx';
export default function MicroScreen() {
  const [products, setProducts] = useState(initialProducts);
  const [filter, setFilter] = useState('');
  const [newName, setNewName] = useState('');
  const [newQty, setNewQty] = useState('0');
  const filtered = products.filter(p => p.name.toLowerCase().includes(filter.toLowerCase()));
  const addProduct = () => {
    if (!newName.trim()) return;
    setProducts([...products, { id: `p${Date.now()}`, name:newName.trim(), quantity: parseInt(newQty), price:0, category:'' }]);
    setNewName(''); setNewQty('0');
  };
  const updateQty = (id, change) => {
    setProducts(products.map(p => p.id===id?{...p, quantity: p.quantity + change}:p));
  };
  return (
    <View style={styles.container}>
      <Text style={styles.title}>Inventario</Text>
      <TextInput placeholder="Buscar producto" value={filter} onChangeText={setFilter} style={styles.input} />
      <FlatList
        data={filtered}
        keyExtractor={p => p.id}
        renderItem={({item})=> (
          <View style={styles.row}>
            <Text>{item.name}: {item.quantity}</Text>
            <View style={{flexDirection:'row'}}>
              <Button title="+" onPress={()=>updateQty(item.id,1)} />
              <Button title="-" onPress={()=>updateQty(item.id,-1)} />
            </View>
          </View>
        )}
      />
      <Text style={{marginTop:20}}>Agregar Producto</Text>
      <TextInput placeholder="Nombre" value={newName} onChangeText={setNewName} style={styles.input} />
      <TextInput placeholder="Cantidad" value={newQty} keyboardType="numeric" onChangeText={setNewQty} style={styles.input} />
      <Button title="Agregar" onPress={addProduct} />
    </View>
  );
}
const styles = StyleSheet.create({ container:{flex:1,padding:20}, title:{fontSize:18,marginBottom:10}, input:{borderWidth:1,padding:8,marginVertical:5}, row:{flexDirection:'row',justifyContent:'space-between',alignItems:'center',padding:10,borderBottomWidth:1} });
