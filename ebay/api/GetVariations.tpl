{*
* 2007-2016 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author    PrestaShop SA <contact@prestashop.com>
*  @copyright 2007-2016 PrestaShop SA
*  @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<Variations>
	<VariationSpecificsSet>
	{foreach from=$variation_specifics_set key=name item=values}
		<NameValueList>
			<Name>{$name}</Name>
			{foreach from=$values item=value}
				<Value><![CDATA[{$value}]]></Value>
			{/foreach}
		</NameValueList>
	{/foreach}
	</VariationSpecificsSet>
	{foreach from=$variations key=variation_key item=variation}
		<Variation>
			<SKU>prestashop-{$variation_key}</SKU>
			{if $price_update}
				<StartPrice>{$variation.price}</StartPrice>
			{/if}
			<Quantity>{$variation.quantity}</Quantity>
			<VariationSpecifics>
				{foreach from=$variation.variation_specifics key=name item=value}
					<NameValueList>
						<Name>{$name}</Name>
						<Value><![CDATA[{$value}]]></Value>
					</NameValueList>
				{/foreach}				
			</VariationSpecifics>
            
            {if isset($variation.price_original)}
                <DiscountPriceInfo>
                    <OriginalRetailPrice>{$variation.price_original}</OriginalRetailPrice>
                    <SoldOffeBay>true</SoldOffeBay>
                </DiscountPriceInfo>
            {/if}
			{if (isset($ean_not_applicable) && $ean_not_applicable == 1)}
				{assign var="does_not_apply" value="Does not apply"}
			{else}
				{assign var="does_not_apply" value=""}
			{/if}
			<VariationProductListingDetails>
				{if ($synchronize_ean != "")}<EAN>{if isset($variation.ean13) && $variation.ean13 != ''}{$variation.ean13}{else}{$does_not_apply}{/if}</EAN>{/if}
				{if ($synchronize_isbn != "")}<ISBN>{if isset($variation.isbn) && $variation.isbn != ''}{$variation.isbn}{else}{$does_not_apply}{/if}</ISBN>{/if}
				{if ($synchronize_upc != "")}<UPC>{if isset($variation.upc) && $variation.upc != ''}{$variation.upc}{else}{$does_not_apply}{/if}</UPC>{/if}
			</VariationProductListingDetails>
		</Variation>
	{/foreach}
	<Pictures>
	{foreach from=$variations_pictures item=variations_pictures_list}
		{foreach from=$variations_pictures_list item=picture}
			{if isset($picture.name)}
				<VariationSpecificName><![CDATA[{$picture.name}]]></VariationSpecificName>
			{/if}
			<VariationSpecificPictureSet>
				<VariationSpecificValue><![CDATA[{$picture.value}]]></VariationSpecificValue>                
				<PictureURL>{$picture.url}</PictureURL>
			</VariationSpecificPictureSet>
		{/foreach}
	{/foreach}
	</Pictures>
</Variations>
