
unit EditKarta_dolzFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, Karta_dolzController ;

type
  TfrmKarta_dolzFilterEdit = class(TDialogForm)

    lblName_dolz : TLabel;
    edtName_dolz: TEdit;
    lblRazryad : TLabel;
    edtRazryad: TEdit;


  HTTPRIOKarta_dolz: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmKarta_dolzFilterEdit: TfrmKarta_dolzFilterEdit;
  Karta_dolzFilterObj: Karta_dolzFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, Karta_dolzController  ;
}
{$R *.dfm}



procedure TfrmKarta_dolzFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName_dolz
      ,edtRazryad
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName_dolz.Text := Karta_dolzObj.name_dolz; 



    edtRazryad.Text := Karta_dolzObj.razryad; 


  end;

}

end;



procedure TfrmKarta_dolzFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
//var TempKarta_dolz: Karta_dolzControllerSoapPort; //»сключено объ€вление не используемых переменных
begin
  if (ModalResult = mrOk)  then
  begin

     Karta_dolzFilterObj.name_dolz := edtName_dolz.Text; 



     Karta_dolzFilterObj.razryad := edtRazryad.Text; 




  end;
end;




end.