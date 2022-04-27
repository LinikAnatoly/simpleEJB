
unit EditENConnectionLineTypeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENConnectionLineTypeController ;

type
  TfrmENConnectionLineTypeFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENConnectionLineType: THTTPRIO;

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
  frmENConnectionLineTypeFilterEdit: TfrmENConnectionLineTypeFilterEdit;
  ENConnectionLineTypeFilterObj: ENConnectionLineTypeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENConnectionLineTypeController  ;
}
{$R *.dfm}



procedure TfrmENConnectionLineTypeFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENConnectionLineTypeObj.name; 


  end;

}

end;



procedure TfrmENConnectionLineTypeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENConnectionLineType: ENConnectionLineTypeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENConnectionLineTypeFilterObj.name := edtName.Text; 




  end;
end;




end.