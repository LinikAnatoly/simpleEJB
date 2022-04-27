
unit EditSCUsageInputItemKindFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCUsageInputItemKindController ;

type
  TfrmSCUsageInputItemKindFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOSCUsageInputItemKind: THTTPRIO;

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
  frmSCUsageInputItemKindFilterEdit: TfrmSCUsageInputItemKindFilterEdit;
  SCUsageInputItemKindFilterObj: SCUsageInputItemKindFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCUsageInputItemKindController  ;
}
{$R *.dfm}



procedure TfrmSCUsageInputItemKindFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := SCUsageInputItemKindObj.name; 


  end;

}

end;



procedure TfrmSCUsageInputItemKindFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCUsageInputItemKind: SCUsageInputItemKindControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCUsageInputItemKindFilterObj.name := edtName.Text; 




  end;
end;




end.