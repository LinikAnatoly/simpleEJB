
unit EditENSettingsFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSettingsController ;

type
  TfrmENSettingsFilterEdit = class(TDialogForm)

    lblKey : TLabel;
    edtKey: TEdit;

    lblComment : TLabel;
    edtComment: TMemo;



  HTTPRIOENSettings: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblCurrentValue: TLabel;
    edtCurrentValue: TMemo;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENSettingsFilterEdit: TfrmENSettingsFilterEdit;
  ENSettingsFilterObj: ENSettingsFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSettingsController  ;
}
{$R *.dfm}



procedure TfrmENSettingsFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtKey.Text := ENSettingsObj.key; 



    MakeMultiline(edtComment.Lines, ENSettingsObj.comment);


  end;

}

end;



procedure TfrmENSettingsFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSettings: ENSettingsControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSettingsFilterObj.key := edtKey.Text; 



     ENSettingsFilterObj.comment := Trim(edtComment.Text);
     ENSettingsFilterObj.currentValue := Trim(edtCurrentValue.Text);
  end;
end;




end.