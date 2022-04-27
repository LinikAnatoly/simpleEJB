
unit EditRQPlanPayStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayStatusController ;

type
  TfrmRQPlanPayStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQPlanPayStatus: THTTPRIO;

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
  frmRQPlanPayStatusFilterEdit: TfrmRQPlanPayStatusFilterEdit;
  RQPlanPayStatusFilterObj: RQPlanPayStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayStatusController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQPlanPayStatusObj.name; 


  end;

}

end;



procedure TfrmRQPlanPayStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayStatus: RQPlanPayStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPlanPayStatusFilterObj.name := edtName.Text; 




  end;
end;




end.