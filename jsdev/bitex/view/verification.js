// goog.provide('bitex.view.VerificationView');

import 'bitex.view.View'



/**
 * @param {*} app
 * @param {goog.dom.DomHelper=} opt_domHelper
 * @constructor
 * @extends {bitex.view.View}
 */
bitex.view.VerificationView = function(app, opt_domHelper) {
  bitex.view.View.call(this, app, opt_domHelper);
  this.loaded_jot_form_ = false;
};
goog.inherits(bitex.view.VerificationView, bitex.view.View);

/**
 * @type {boolean}
 */
bitex.view.VerificationView.prototype.loaded_jot_form_;

bitex.view.VerificationView.prototype.enterView = function() {
  goog.base(this, 'enterView');
  if (this.loaded_jot_form_) {
    return;
  }

  var model = this.getApplication().getModel();

  var broker = model.get('Broker');
  if (!goog.isDefAndNotNull(broker)){
    return;
  }

  var stunt_ip_str = goog.json.serialize(this.getApplication().getSTUNTIp());

  var verification_form_url =  broker['VerificationForm'];
  verification_form_url = verification_form_url.replace('{{UserID}}', model.get('UserID'));
  verification_form_url = verification_form_url.replace('{{Username}}', model.get('Username'));
  verification_form_url = verification_form_url.replace('{{BrokerID}}', model.get('Broker')['BrokerID']);
  verification_form_url = verification_form_url.replace('{{BrokerUsername}}', model.get('Broker')['ShortName']);
  verification_form_url = verification_form_url.replace('{{Email}}', model.get('Profile')['Email']);
  verification_form_url = verification_form_url.replace('{{FingerPrint}}',  this.getApplication().getFingerPrint());
  verification_form_url = verification_form_url.replace('{{STUNTIp}}',  stunt_ip_str);
  verification_form_url = verification_form_url.replace('{{language}}',  goog.LOCALE);


  if (goog.isDefAndNotNull(model.get('Profile')['State'])) {
    verification_form_url = verification_form_url.replace('{{State}}', model.get('Profile')['State'] );
  } else {
    verification_form_url = verification_form_url.replace('{{State}}', "");
  }

  var form_src = verification_form_url;

  var verificationIFrameForm = goog.dom.getElement("JotFormIFrame");

  if (verificationIFrameForm.src !== form_src ) {
    verificationIFrameForm.src = form_src;
    this.loaded_jot_form_ = true;
  }
};

bitex.view.VerificationView.prototype.enterDocument = function() {
  goog.base(this, 'enterDocument');
};
