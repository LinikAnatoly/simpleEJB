
unit EditENSituationRPNFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSituationRPNController ;

type
  TfrmENSituationRPNFilterEdit = class(TDialogForm)

    lblValue : TLabel;
    edtValue: TEdit;

    lblDescription : TLabel;
    edtDescription: TEdit;



  HTTPRIOENSituationRPN: THTTPRIO;

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
  frmENSituationRPNFilterEdit: TfrmENSituationRPNFilterEdit;
  ENSituationRPNFilterObj: ENSituationRPNFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSituationRPNController  ;
}
{$R *.dfm}



procedure TfrmENSituationRPNFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtValue
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENSituationRPNObj.value <> Low(Integer) ) then
       edtValue.Text := IntToStr(ENSituationRPNObj.value)
    else
       edtValue.Text := '';



    edtDescription.Text := ENSituationRPNObj.description; 


  end;

}

end;



procedure TfrmENSituationRPNFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSituationRPN: ENSituationRPNControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtValue.Text <> '' ) then
       ENSituationRPNFilterObj.value := StrToInt(edtValue.Text)
     else
       ENSituationRPNFilterObj.value := Low(Integer) ;




     ENSituationRPNFilterObj.description := edtDescription.Text; 




  end;
end;




end.