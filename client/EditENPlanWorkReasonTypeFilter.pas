
unit EditENPlanWorkReasonTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkReasonTypeController ;

type
  TfrmENPlanWorkReasonTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENPlanWorkReasonType: THTTPRIO;

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
  frmENPlanWorkReasonTypeFilterEdit: TfrmENPlanWorkReasonTypeFilterEdit;
  ENPlanWorkReasonTypeFilterObj: ENPlanWorkReasonTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkReasonTypeController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkReasonTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPlanWorkReasonTypeObj.name; 


  end;

}

end;



procedure TfrmENPlanWorkReasonTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkReasonType: ENPlanWorkReasonTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkReasonTypeFilterObj.name := edtName.Text; 




  end;
end;




end.