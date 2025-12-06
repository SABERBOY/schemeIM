
import React, { useState, useEffect } from 'react';
import { THEME } from './constants';
import { Icon } from './Icon';
import { User, SharedProps } from './types';

interface LoginProps extends SharedProps {
  onLogin: (user: Partial<User>) => void;
  onSetLang: (l: 'en' | 'ar') => void;
}

export const Login = ({ onLogin, lang, t, onSetLang }: LoginProps) => {
  const [step, setStep] = useState<1 | 2>(1); // 1: Phone, 2: OTP
  const [phone, setPhone] = useState('');
  const [otp, setOtp] = useState('');
  const [loading, setLoading] = useState(false);
  const [timer, setTimer] = useState(0);
  const [countryCode, setCountryCode] = useState('+971');

  useEffect(() => {
    let interval: any;
    if (timer > 0) {
      interval = setInterval(() => setTimer(t => t - 1), 1000);
    }
    return () => clearInterval(interval);
  }, [timer]);

  const handleSendOtp = () => {
    if (phone.length < 5) return;
    setLoading(true);
    // Simulate API call
    setTimeout(() => {
      setLoading(false);
      setStep(2);
      setTimer(60);
    }, 1500);
  };

  const handleVerify = () => {
    if (otp.length !== 4) return;
    setLoading(true);
    // Simulate verify API
    setTimeout(() => {
      setLoading(false);
      // Success
      onLogin({
        id: `user_${Date.now()}`,
        name: `User ${phone.slice(-4)}`,
        gold: 100,
      });
    }, 1500);
  };

  const handleResend = () => {
    if (timer > 0) return;
    setLoading(true);
    setTimeout(() => {
      setLoading(false);
      setTimer(60);
    }, 1000);
  };

  return (
    <div style={{
      height: '100%', width: '100%',
      backgroundColor: THEME.bg,
      display: 'flex', flexDirection: 'column', alignItems: 'center', justifyContent: 'center',
      padding: '20px',
      color: 'white'
    }}>
      {/* Language Toggle */}
      <div style={{ position: 'absolute', top: 20, [lang === 'ar' ? 'left' : 'right']: 20 }}>
        <button 
          onClick={() => onSetLang(lang === 'en' ? 'ar' : 'en')}
          style={{
            background: 'rgba(255,255,255,0.1)', border: 'none', color: 'white',
            padding: '5px 10px', borderRadius: '5px', cursor: 'pointer'
          }}
        >
          {lang === 'en' ? 'العربية' : 'English'}
        </button>
      </div>

      <div style={{ 
        width: 100, height: 100, borderRadius: '25px', 
        background: 'linear-gradient(135deg, #311B92, #E91E63)',
        display: 'flex', alignItems: 'center', justifyContent: 'center',
        marginBottom: '30px', boxShadow: '0 8px 20px rgba(233, 30, 99, 0.4)'
      }}>
        <Icon name="smartphone" size={50} />
      </div>

      <h2 style={{ marginBottom: '10px' }}>{t('welcomeBack')}</h2>
      <p style={{ color: '#888', marginBottom: '40px' }}>{t('login')}</p>

      {step === 1 && (
        <div style={{ width: '100%', maxWidth: '350px', display: 'flex', flexDirection: 'column', gap: '20px' }}>
          <label style={{ color: '#AAA', fontSize: '0.9rem' }}>{t('enterPhone')}</label>
          <div style={{ display: 'flex', gap: '10px' }}>
            <select 
              value={countryCode}
              onChange={e => setCountryCode(e.target.value)}
              style={{
                padding: '15px', borderRadius: '12px', border: 'none',
                backgroundColor: THEME.surface, color: 'white', outline: 'none',
                appearance: 'none'
              }}
            >
              <option value="+971">🇦🇪 +971</option>
              <option value="+966">🇸🇦 +966</option>
              <option value="+20">🇪🇬 +20</option>
              <option value="+1">🇺🇸 +1</option>
            </select>
            <input 
              type="tel"
              value={phone}
              onChange={e => setPhone(e.target.value.replace(/\D/g, ''))}
              placeholder={t('phonePlaceholder')}
              style={{
                flex: 1, padding: '15px', borderRadius: '12px', border: 'none',
                backgroundColor: THEME.surface, color: 'white', outline: 'none',
                fontSize: '1rem', letterSpacing: '1px'
              }}
            />
          </div>
          <button 
            onClick={handleSendOtp}
            disabled={loading || phone.length < 5}
            style={{
              padding: '15px', borderRadius: '12px', border: 'none',
              background: 'linear-gradient(90deg, #311B92, #673AB7)',
              color: 'white', fontWeight: 'bold', fontSize: '1rem',
              cursor: loading ? 'wait' : 'pointer', opacity: (loading || phone.length < 5) ? 0.7 : 1,
              marginTop: '10px'
            }}
          >
            {loading ? t('loading') : t('sendCode')}
          </button>
        </div>
      )}

      {step === 2 && (
        <div style={{ width: '100%', maxWidth: '350px', display: 'flex', flexDirection: 'column', gap: '20px' }}>
          <label style={{ color: '#AAA', fontSize: '0.9rem' }}>{t('enterCode')} ({countryCode} {phone})</label>
          
          <input 
            type="text"
            maxLength={4}
            value={otp}
            onChange={e => setOtp(e.target.value.replace(/\D/g, ''))}
            placeholder="0000"
            style={{
              width: '100%', padding: '15px', borderRadius: '12px', border: 'none',
              backgroundColor: THEME.surface, color: 'white', outline: 'none',
              fontSize: '1.5rem', letterSpacing: '10px', textAlign: 'center'
            }}
          />

          <div style={{ display: 'flex', justifyContent: 'center' }}>
            {timer > 0 ? (
              <span style={{ color: '#888', fontSize: '0.9rem' }}>{t('resendIn')} {timer}s</span>
            ) : (
              <button 
                onClick={handleResend}
                style={{ background: 'none', border: 'none', color: THEME.secondary, cursor: 'pointer', fontSize: '0.9rem' }}
              >
                {t('resend')}
              </button>
            )}
          </div>

          <button 
            onClick={handleVerify}
            disabled={loading || otp.length !== 4}
            style={{
              padding: '15px', borderRadius: '12px', border: 'none',
              background: 'linear-gradient(90deg, #311B92, #673AB7)',
              color: 'white', fontWeight: 'bold', fontSize: '1rem',
              cursor: loading ? 'wait' : 'pointer', opacity: (loading || otp.length !== 4) ? 0.7 : 1,
              marginTop: '10px'
            }}
          >
             {loading ? t('loading') : t('verify')}
          </button>
          
          <button 
             onClick={() => { setStep(1); setOtp(''); }}
             style={{ background: 'none', border: 'none', color: '#888', marginTop: '10px', cursor: 'pointer' }}
          >
            {t('back')}
          </button>
        </div>
      )}
    </div>
  );
};
