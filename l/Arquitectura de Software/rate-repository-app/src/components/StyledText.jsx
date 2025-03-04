import React from "react";
import { Text, StyleSheet } from "react-native";

import theme from "../theme.js";

const styles = StyleSheet.create({
    text:{
        color: theme.colors.textPrimary,
        fontSize: theme.fontSizes.body,
        fontFamily: theme.font.main,
        fontWeight: theme.fontWeights.normal
    },
    bold:{
        fontWeight: theme.fontWeights.bold
    },
    colorViolet:{
        color: theme.colors.textViolet
    },
    colorWhite:{
        color: theme.colors.white
    },
    colorPrimary:{
        color: theme.colors.textPrimary
    },
    colorSecondary:{
        color: theme.colors.textSecondary
    },
    subheading:{
        fontSize: theme.fontSizes.subheading
    },
    textBody:{
        fontSize: theme.fontSizes.body
    },
    textSmall:{
        fontSize: theme.fontSizes.small
    },
    textAlingCenter:{
        textAlign: 'center'
    }
})
{{/*Componente resusable para dar estilo en la app*/}}
export default function StyledText ({color, aling, bold, fontSize, fontWeight, children, style, ...restOfProps}) {
    const textStyles = [
        styles.text, 
        color === 'primary' && styles.colorPrimary,
        color === 'secondary' && styles.colorSecondary,
        color === 'violet' && styles.colorViolet,
        color === 'white' && styles.colorWhite,
        fontSize === 'subheading' && styles.subheading,
        fontSize === 'textBody' && styles.textBody,
        fontSize === 'small' && styles.textSmall,
        fontWeight === 'bold' && styles.bold,
        aling === 'center' && styles.textAlingCenter,
        style
    ]
    return (
        <Text style={textStyles}{...restOfProps}>
            {children}
        </Text>
    )
}