public class AudioPlay extends Component
{
  private AudioPlayer Audio;
  private float ValueVolume;
  private boolean Loop;
  
  // the contructer
  //AudioPlay("file_name","Volume from 6.0 to -80", boolean for whether you want the sound to loop)
  public AudioPlay(AudioPlayer pAudio, float pValueVolume, boolean pLoop)
  {
    //if (pAudio != null){
      Audio = pAudio;
      ValueVolume = pValueVolume ;
      Loop = pLoop;
  // }
  }
  
  @Override
  public void update()
  {
    //not to elegant but it works XD
    //if (Audio!= null) {
      Audio.setGain(ValueVolume);
      //Audio.printControls();
      if(!Loop){
      Audio.play(); 
      }
      else if(Loop)
      {
        Audio.play();
         if (Audio.position()>=Audio.length()) 
          {
             Audio.rewind();
          }
      //}
    }
  }
}
