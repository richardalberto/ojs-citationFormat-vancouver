{**
 * citation.tpl
 *
 * Copyright (c) 2008 Richard Gonz�lez Alberto
 * Distributed under the GNU GPL v2. For full terms see the file docs/COPYING.
 *
 * Article reading tools -- Capture Citation
 *
 *}
<div class="separator"></div>

{assign var=authors value=$article->getAuthors()}
{assign var=authorCount value=$authors|@count}
{assign var=authorNumber value=1}
{foreach from=$authors item=author name=authors key=i}
{$citationPlugin->getAuthorFormatedName($author->getFirstName(), $author->getLastName())}{if $authorCount == $authorNumber}.{else}, {/if}
{assign var=authorNumber value=$authorNumber+1}
{/foreach}
 {$article->getArticleTitle()|strip_unsafe_html}.
<strong>{$journal->getJournalTitle()|escape}</strong> [{translate key="plugins.citationFormats.vancouver.serialOnTheInternet"}].
{assign var=datePublished value=$article->getDatePublished()|date_format:'%Y %b %e'}
{assign var=dateNow value=$smarty.now|date_format:'%Y %b %e'}
{$datePublished|capitalize}; [{translate key="plugins.citationFormats.vancouver.cited"} {$dateNow|capitalize}];
{$issue->getVolume()}({$issue->getNumber()}):[{translate key="plugins.citationFormats.vancouver.about"} {$article->getPages()} p.].
{url|assign:"articleUrl" page="article" op="view" path=$article->getArticleId()}
{translate key="plugins.citationFormats.vancouver.availableFrom"}: <a href="{$articleUrl}">{$articleUrl}</a>
