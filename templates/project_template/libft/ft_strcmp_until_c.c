/* ************************************************************************** */
/*                                                                            */
/*                                                        :::      ::::::::   */
/*   ft_strcmp_until_c.c                                :+:      :+:    :+:   */
/*                                                    +:+ +:+         +:+     */
/*   By: penzo <marvin@42.fr>                       +#+  +:+       +#+        */
/*                                                +#+#+#+#+#+   +#+           */
/*   Created: 2019/03/12 14:11:29 by penzo             #+#    #+#             */
/*   Updated: 2019/03/12 14:12:16 by penzo            ###   ########.fr       */
/*                                                                            */
/* ************************************************************************** */

#include "libft.h"

int		ft_strcmp_until_c(char *s1, char *s2, char c)
{
	int		i;

	if (!s1 && !s2)
		return (0);
	if (!s1 || !s2)
		return (-1);
	i = -1;
	while (s1[++i] != c)
	{
		if (s1[i] != s2[i])
			return (1);
	}
	if (s2[i] == c)
		return (0);
	return (1);
}
