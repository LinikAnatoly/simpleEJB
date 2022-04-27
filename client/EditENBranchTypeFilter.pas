
unit EditENBranchTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENBranchTypeController ;

type
  TfrmENBranchTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENBranchType: THTTPRIO;

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
  frmENBranchTypeFilterEdit: TfrmENBranchTypeFilterEdit;
  ENBranchTypeFilterObj: ENBranchTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENBranchTypeController  ;
}
{$R *.dfm}



procedure TfrmENBranchTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENBranchTypeObj.name; 


  end;

}

end;



procedure TfrmENBranchTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENBranchType: ENBranchTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENBranchTypeFilterObj.name := edtName.Text; 




  end;
end;




end.