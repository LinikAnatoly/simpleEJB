
unit EditENFuseTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFuseTypeController ;

type
  TfrmENFuseTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENFuseType: THTTPRIO;

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
  frmENFuseTypeFilterEdit: TfrmENFuseTypeFilterEdit;
  ENFuseTypeFilterObj: ENFuseTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFuseTypeController  ;
}
{$R *.dfm}



procedure TfrmENFuseTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENFuseTypeObj.name; 


  end;

}

end;



procedure TfrmENFuseTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFuseType: ENFuseTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFuseTypeFilterObj.name := edtName.Text; 




  end;
end;




end.