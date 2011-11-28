<p> This is a helper to shorten links using bitly.  It is simple to implement and uses <br />
<a href="http://allseeing-i.com/ASIHTTPRequest/">ASIHTTPRequest</a> and <a href="https://github.com/stig/json-framework">SBJSON</a>
</p>

<p> Replace the kBitlyLoginName and kBitlyAPIKey in BTBitlyHelper.m with your login name and api key. <br />
The sample project shows the basic use for this helper.  Any links entered into the text view are shortened and replaced.</p>

<p> The helper makes use of the following delegate methods.

<pre>

/**
 *  Receives the shortened url for the given original url.
 *
 *  @param  shortUrl    The short url received from bit.ly.
 *  @param  originalUrl The original url given to bit.ly.
 */
- (void) BTBitlyShortUrl: (NSString *) shortUrl receivedForOriginalUrl: (NSString *) originalUrl;

/**
 *  Called when the queue starts processing.
 */
- (void) BTBitlyQueueStartedProcessing;

/**
 *  Called when the queue is done processing.
 */
- (void) BTBitlyQueueFinishedProcessing;

</pre>

</p>