import React from 'react';
import { View } from 'react-native';    
import StyledText from './StyledText.jsx';

const parseThousands = (value) => {
    return value >= 1000 ? `${Math.round(value / 100)/10}k` : String(value);
}

const RepositoryStats = (props) => {
    return (
        <View style={{flexDirection: 'row', justifyContent: 'space-around'}}>
            <View>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'} fontWeight={'bold'}>{parseThousands(props.stargazersCount)}</StyledText>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'}>Stars</StyledText>
            </View>
            <View>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'} fontWeight={'bold'}>{parseThousands(props.forksCount)}</StyledText>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'}>Forks</StyledText>
            </View>
            <View>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'} fontWeight={'bold'}>{props.reviewCount}</StyledText>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'}>Review</StyledText>
            </View>
            <View>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'} fontWeight={'bold'}>{props.ratingAverage}</StyledText>
                <StyledText aling={'center'} color={'secondary'} fontSize={'small'}>Rating</StyledText>
            </View>
        </View>
    )
}

export default RepositoryStats;