
unit EditSCCounterStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, SCCounterStatusController ;

type
  TfrmSCCounterStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOSCCounterStatus: THTTPRIO;

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
  frmSCCounterStatusFilterEdit: TfrmSCCounterStatusFilterEdit;
  SCCounterStatusFilterObj: SCCounterStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, SCCounterStatusController  ;
}
{$R *.dfm}



procedure TfrmSCCounterStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := SCCounterStatusObj.name; 


  end;

}

end;



procedure TfrmSCCounterStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempSCCounterStatus: SCCounterStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     SCCounterStatusFilterObj.name := edtName.Text; 




  end;
end;




end.