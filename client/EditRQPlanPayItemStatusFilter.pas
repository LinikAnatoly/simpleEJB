
unit EditRQPlanPayItemStatusFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, RQPlanPayItemStatusController ;

type
  TfrmRQPlanPayItemStatusFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIORQPlanPayItemStatus: THTTPRIO;

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
  frmRQPlanPayItemStatusFilterEdit: TfrmRQPlanPayItemStatusFilterEdit;
  RQPlanPayItemStatusFilterObj: RQPlanPayItemStatusFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, RQPlanPayItemStatusController  ;
}
{$R *.dfm}



procedure TfrmRQPlanPayItemStatusFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := RQPlanPayItemStatusObj.name; 


  end;

}

end;



procedure TfrmRQPlanPayItemStatusFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempRQPlanPayItemStatus: RQPlanPayItemStatusControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     RQPlanPayItemStatusFilterObj.name := edtName.Text; 




  end;
end;




end.