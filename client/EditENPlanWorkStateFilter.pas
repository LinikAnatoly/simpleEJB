
unit EditENPlanWorkStateFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENPlanWorkStateController ;

type
  TfrmENPlanWorkStateFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENPlanWorkState: THTTPRIO;

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
  frmENPlanWorkStateFilterEdit: TfrmENPlanWorkStateFilterEdit;
  ENPlanWorkStateFilterObj: ENPlanWorkStateFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENPlanWorkStateController  ;
}
{$R *.dfm}



procedure TfrmENPlanWorkStateFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENPlanWorkStateObj.name; 


  end;

}

end;



procedure TfrmENPlanWorkStateFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENPlanWorkState: ENPlanWorkStateControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENPlanWorkStateFilterObj.name := edtName.Text; 




  end;
end;




end.