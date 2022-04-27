
unit EditSCUsageInputStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputStatusController ;

type
  TfrmSCUsageInputStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOSCUsageInputStatus: THTTPRIO;

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
  frmSCUsageInputStatusFilterEdit: TfrmSCUsageInputStatusFilterEdit;
  SCUsageInputStatusFilterObj: SCUsageInputStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCUsageInputStatusController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputStatusFilterEdit.FormShow(Sender: TObject);

begin

{ ���� ���� �� ������ ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := SCUsageInputStatusObj.name; 


  end;

}

end;



procedure TfrmSCUsageInputStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputStatus: SCUsageInputStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCUsageInputStatusFilterObj.name := edtName.Text; 




  end;
end;




end.