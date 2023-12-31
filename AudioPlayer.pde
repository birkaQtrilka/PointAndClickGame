public class AudioPlay 
{
  private AudioPlayer Audio;
  private float ValueVolume;
  private boolean Loop;
  boolean _play;
  // the contructer
  //AudioPlay("file_name","Volume from 6.0 to -80", boolean for whether you want the sound to loop)
  public AudioPlay(AudioPlayer pAudio, float pValueVolume, boolean pLoop)
  {
    Audio = pAudio;
    ValueVolume = pValueVolume ;
    Loop = pLoop;
    Audio.setGain(ValueVolume);
  }
  public void play()
  {
    Audio.play();
    Audio.rewind();
    _play = true;
  }
  public void update()
  {
    if(!Loop || !_play) return;
    
    if (Audio.position() >= Audio.length()) 
    {
      Audio.rewind();
      Audio.play();    
    }
  }
  
}
