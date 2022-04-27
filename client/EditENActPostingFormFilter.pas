
unit EditENActPostingFormFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENActPostingFormController ;

type
  TfrmENActPostingFormFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;



  HTTPRIOENActPostingForm: THTTPRIO;

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
  frmENActPostingFormFilterEdit: TfrmENActPostingFormFilterEdit;
  ENActPostingFormFilterObj: ENActPostingFormFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENActPostingFormController  ;
}
{$R *.dfm}



procedure TfrmENActPostingFormFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENActPostingFormObj.name; 


  end;

}

end;



procedure TfrmENActPostingFormFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENActPostingForm: ENActPostingFormControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENActPostingFormFilterObj.name := edtName.Text; 




  end;
end;




end.