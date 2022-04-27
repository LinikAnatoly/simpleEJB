
unit EditENExecutorFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENExecutorController ;

type
  TfrmENExecutorFilterEdit = class(TDialogForm)

    lblExecutorFio : TLabel;
    edtExecutorFio: TEdit;

    lblExecutorPhone : TLabel;
    edtExecutorPhone: TEdit;

    lblExecutorEmail : TLabel;
    edtExecutorEmail: TEdit;

    lblCommentGen : TLabel;
    edtCommentGen: TEdit;



  HTTPRIOENExecutor: THTTPRIO;

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
  frmENExecutorFilterEdit: TfrmENExecutorFilterEdit;
  ENExecutorFilterObj: ENExecutorFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENExecutorController  ;
}
{$R *.dfm}



procedure TfrmENExecutorFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtExecutorFio
      ,edtExecutorPhone
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtExecutorFio.Text := ENExecutorObj.executorFio; 



    edtExecutorPhone.Text := ENExecutorObj.executorPhone; 



    edtExecutorEmail.Text := ENExecutorObj.executorEmail; 



    edtCommentGen.Text := ENExecutorObj.commentGen; 


  end;

}

end;



procedure TfrmENExecutorFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENExecutor: ENExecutorControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENExecutorFilterObj.executorFio := edtExecutorFio.Text; 



     ENExecutorFilterObj.executorPhone := edtExecutorPhone.Text; 



     ENExecutorFilterObj.executorEmail := edtExecutorEmail.Text; 



     ENExecutorFilterObj.commentGen := edtCommentGen.Text; 




  end;
end;




end.