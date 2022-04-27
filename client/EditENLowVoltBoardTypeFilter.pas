
unit EditENLowVoltBoardTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENLowVoltBoardTypeController ;

type
  TfrmENLowVoltBoardTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENLowVoltBoardType: THTTPRIO;

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
  frmENLowVoltBoardTypeFilterEdit: TfrmENLowVoltBoardTypeFilterEdit;
  ENLowVoltBoardTypeFilterObj: ENLowVoltBoardTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENLowVoltBoardTypeController  ;
}
{$R *.dfm}



procedure TfrmENLowVoltBoardTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENLowVoltBoardTypeObj.name; 


  end;

}

end;



procedure TfrmENLowVoltBoardTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENLowVoltBoardType: ENLowVoltBoardTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENLowVoltBoardTypeFilterObj.name := edtName.Text; 




  end;
end;




end.