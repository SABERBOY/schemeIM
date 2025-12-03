
import React, { useState, useRef } from 'react';
import { GoogleGenAI } from "@google/genai";
import { THEME } from './constants';
import { Icon } from './Icon';

export const ImageStudio = () => {
  const [prompt, setPrompt] = useState('');
  const [selectedImage, setSelectedImage] = useState<string | null>(null);
  const [generatedImage, setGeneratedImage] = useState<string | null>(null);
  const [loading, setLoading] = useState(false);
  const fileInputRef = useRef<HTMLInputElement>(null);

  const handleImageUpload = (event: React.ChangeEvent<HTMLInputElement>) => {
    const file = event.target.files?.[0];
    if (file) {
      const reader = new FileReader();
      reader.onloadend = () => {
        setSelectedImage(reader.result as string);
        setGeneratedImage(null); // Reset generated image when new image is uploaded
      };
      reader.readAsDataURL(file);
    }
  };

  const handleGenerate = async () => {
    if (!prompt.trim() || !selectedImage) return;
    setLoading(true);
    setGeneratedImage(null);

    try {
      const ai = new GoogleGenAI({ apiKey: process.env.API_KEY || '' });
      
      // Extract base64 data
      const base64Data = selectedImage.split(',')[1];
      const mimeType = selectedImage.split(';')[0].split(':')[1];

      const response = await ai.models.generateContent({
        model: 'gemini-2.5-flash-image',
        contents: {
            parts: [
                {
                    inlineData: {
                        data: base64Data,
                        mimeType: mimeType
                    }
                },
                {
                    text: prompt
                }
            ]
        }
      });

      // Parse response for image
      let foundImage = false;
      if (response.candidates?.[0]?.content?.parts) {
        for (const part of response.candidates[0].content.parts) {
          if (part.inlineData) {
            const imgUrl = `data:image/png;base64,${part.inlineData.data}`;
            setGeneratedImage(imgUrl);
            foundImage = true;
            break;
          }
        }
      }

      if (!foundImage && response.text) {
          console.log("Model returned text instead of image:", response.text);
          alert("The model returned text instead of an image. Try a different prompt.");
      }

    } catch (error) {
      console.error("Generation error:", error);
      alert("Failed to generate image. Please try again.");
    } finally {
      setLoading(false);
    }
  };

  return (
    <div style={{ height: '100%', display: 'flex', flexDirection: 'column', backgroundColor: THEME.bg, padding: '20px' }}>
      <h2 style={{ color: 'white', marginBottom: '20px', display: 'flex', alignItems: 'center', gap: '10px' }}>
        <Icon name="magic" color={THEME.secondary} size={28} />
        AI Studio
      </h2>

      <div style={{ flex: 1, display: 'flex', flexDirection: 'column', gap: '20px', overflowY: 'auto' }}>
        
        {/* Image Preview Area */}
        <div style={{ 
          minHeight: '300px', backgroundColor: THEME.surface, borderRadius: '15px', 
          display: 'flex', alignItems: 'center', justifyContent: 'center',
          position: 'relative', overflow: 'hidden', border: `1px solid #333`
        }}>
          {!selectedImage ? (
             <div 
               onClick={() => fileInputRef.current?.click()}
               style={{ display: 'flex', flexDirection: 'column', alignItems: 'center', cursor: 'pointer', color: '#888' }}
             >
                <Icon name="add" size={48} color="#555" />
                <span style={{ marginTop: '10px' }}>Tap to Upload Image</span>
             </div>
          ) : (
             <div style={{ display: 'flex', width: '100%', height: '100%' }}>
                <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '10px' }}>
                    <span style={{ color: '#888', marginBottom: '5px', fontSize: '0.8rem' }}>Original</span>
                    <img src={selectedImage} style={{ maxWidth: '100%', maxHeight: '250px', borderRadius: '8px', objectFit: 'contain' }} />
                </div>
                {generatedImage && (
                    <div style={{ flex: 1, display: 'flex', flexDirection: 'column', alignItems: 'center', padding: '10px', borderLeft: '1px solid #333' }}>
                        <span style={{ color: THEME.secondary, marginBottom: '5px', fontSize: '0.8rem' }}>AI Edited</span>
                        <img src={generatedImage} style={{ maxWidth: '100%', maxHeight: '250px', borderRadius: '8px', objectFit: 'contain' }} />
                    </div>
                )}
             </div>
          )}
          
          {loading && (
             <div style={{ 
               position: 'absolute', top: 0, left: 0, right: 0, bottom: 0, 
               backgroundColor: 'rgba(0,0,0,0.7)', display: 'flex', alignItems: 'center', justifyContent: 'center',
               color: THEME.secondary, flexDirection: 'column'
             }}>
                 <div style={{ fontSize: '30px', animation: 'spin 1s linear infinite' }}>✨</div>
                 <span style={{ marginTop: '10px' }}>Magic in progress...</span>
             </div>
          )}
        </div>

        <input 
          type="file" 
          ref={fileInputRef} 
          onChange={handleImageUpload} 
          accept="image/*" 
          style={{ display: 'none' }} 
        />
        
        {selectedImage && (
            <div style={{ display: 'flex', justifyContent: 'center' }}>
                <button 
                  onClick={() => fileInputRef.current?.click()}
                  style={{ background: 'transparent', border: '1px solid #666', color: '#AAA', padding: '5px 15px', borderRadius: '20px', fontSize: '0.8rem' }}
                >
                    Change Image
                </button>
            </div>
        )}

        {/* Controls */}
        <div style={{ backgroundColor: THEME.surface, padding: '20px', borderRadius: '15px' }}>
            <label style={{ color: 'white', fontSize: '0.9rem', marginBottom: '10px', display: 'block' }}>
                How should AI change this image?
            </label>
            <div style={{ display: 'flex', gap: '10px' }}>
                <input 
                  value={prompt}
                  onChange={e => setPrompt(e.target.value)}
                  placeholder="e.g., Add a retro filter, Remove background..."
                  style={{ 
                    flex: 1, padding: '12px', borderRadius: '10px', border: 'none', 
                    backgroundColor: '#333', color: 'white' 
                  }}
                />
                <button 
                  onClick={handleGenerate}
                  disabled={!selectedImage || !prompt.trim() || loading}
                  style={{ 
                    backgroundColor: (!selectedImage || !prompt.trim() || loading) ? '#555' : THEME.secondary, 
                    color: 'black', fontWeight: 'bold', border: 'none', borderRadius: '10px', padding: '0 20px',
                    cursor: (!selectedImage || !prompt.trim() || loading) ? 'not-allowed' : 'pointer'
                  }}
                >
                  Go
                </button>
            </div>
            <div style={{ display: 'flex', gap: '8px', marginTop: '10px', overflowX: 'auto', paddingBottom: '5px' }}>
                {["Add a neon glow", "Make it sketch style", "Make it vintage", "Add fireworks in background"].map(p => (
                    <button 
                        key={p}
                        onClick={() => setPrompt(p)}
                        style={{ 
                            background: 'rgba(255,255,255,0.1)', border: 'none', color: '#CCC', 
                            padding: '5px 10px', borderRadius: '15px', fontSize: '0.75rem', whiteSpace: 'nowrap', cursor: 'pointer'
                        }}
                    >
                        {p}
                    </button>
                ))}
            </div>
        </div>
      </div>
    </div>
  );
};
