unit Style.Login;

interface

uses
  System.classes,
  System.SysUtils,
  FMX.Forms;

type
    TStyleLogin = class(TForm)
      public
        const
          // Style Header and Footer...
          LyTopAndButtom        =  $FF802280;

          // Style Body...
          LyBody                =  $FFFFFFFF;

          // Style Label Title...
          LbTitleTextLogin      =  'Login';
          LbTitleTextMenu       =  'Idea Developer';
          LbColor               =  $FFF4EAF4;
          LbFontSize            =  24 ;
          LbHeightSize          =  40 ;
          LbWidthSize           =  200;

          // Text Align...
          LbTextAlign           =  'Certer';

          // Style RCEdits...
          RcBorderRadius        =   25;
          RcBackground          =   $FFFFFFFF;

          // Style Line...
          RcLineLeftAndRight    =   25;

          // Style Edits...
          EdtAling              =   'Client';
          EdtMargem             =   3;
          EdtTextPromptLogin    =   'Login';
          EdtTextPromptSenha    =   'Senha';
          EdiTextColor          =   $AA802280;
    end;

implementation

uses
  FMX.StdCtrls;

{ TStyleLogin }

end.
