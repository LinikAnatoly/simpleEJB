
unit EditENFencingFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFencingController ;

type
  TfrmENFencingFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENFencing: THTTPRIO;

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
  frmENFencingFilterEdit: TfrmENFencingFilterEdit;
  ENFencingFilterObj: ENFencingFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENFencingController  ;
}
{$R *.dfm}



procedure TfrmENFencingFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENFencingObj.name; 


  end;

}

end;



procedure TfrmENFencingFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFencing: ENFencingControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFencingFilterObj.name := edtName.Text; 




  end;
end;




end.