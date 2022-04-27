
unit EditENSubstationTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSubstationTypeController ;

type
  TfrmENSubstationTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;


  HTTPRIOENSubstationType: THTTPRIO;

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
  frmENSubstationTypeFilterEdit: TfrmENSubstationTypeFilterEdit;
  ENSubstationTypeFilterObj: ENSubstationTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSubstationTypeController  ;
}
{$R *.dfm}



procedure TfrmENSubstationTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENSubstationTypeObj.name; 


  end;

}

end;



procedure TfrmENSubstationTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSubstationType: ENSubstationTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENSubstationTypeFilterObj.name := edtName.Text; 




  end;
end;




end.