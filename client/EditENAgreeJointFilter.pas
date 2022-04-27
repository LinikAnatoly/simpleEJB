
unit EditENAgreeJointFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAgreeJointController ;

type
  TfrmENAgreeJointFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblAgreeNum : TLabel;
    edtAgreeNum: TEdit;

    lblAgreeDate : TLabel;
    edtAgreeDate: TDateTimePicker;
    lblBalanceLim : TLabel;
    edtBalanceLim: TMemo;



  HTTPRIOENAgreeJoint: THTTPRIO;

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
  frmENAgreeJointFilterEdit: TfrmENAgreeJointFilterEdit;
  ENAgreeJointFilterObj: ENAgreeJointFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENAgreeJointController  ;
}
{$R *.dfm}



procedure TfrmENAgreeJointFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtAgreeNum
      ,edtBalanceLim
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENAgreeJointObj.name; 



    edtAgreeNum.Text := ENAgreeJointObj.agreeNum; 



      if ENAgreeJointObj.agreeDate <> nil then
      begin
        edtAgreeDate.DateTime:=EncodeDate(ENAgreeJointObj.agreeDate.Year,ENAgreeJointObj.agreeDate.Month,ENAgreeJointObj.agreeDate.Day);
        edtAgreeDate.checked := true;
      end
      else
      begin
        edtAgreeDate.DateTime:=SysUtils.Date;
        edtAgreeDate.checked := false;
      end;



    MakeMultiline(edtBalanceLim.Lines, ENAgreeJointObj.balanceLim);


  end;

}

end;



procedure TfrmENAgreeJointFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAgreeJoint: ENAgreeJointControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAgreeJointFilterObj.name := edtName.Text; 



     ENAgreeJointFilterObj.agreeNum := edtAgreeNum.Text; 



     if edtagreeDate.checked then
     begin 
       if ENAgreeJointFilterObj.agreeDate = nil then
          ENAgreeJointFilterObj.agreeDate := TXSDate.Create;
       ENAgreeJointFilterObj.agreeDate.XSToNative(GetXSDate(edtagreeDate.DateTime));
     end
     else
       ENAgreeJointFilterObj.agreeDate := nil;



     ENAgreeJointFilterObj.balanceLim := edtBalanceLim.Text; 




  end;
end;




end.