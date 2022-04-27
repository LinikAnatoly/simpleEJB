
unit EditENTransportDep2UserFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENTransportDep2UserController ;

type
  TfrmENTransportDep2UserFilterEdit = class(TDialogForm)

    lblUserCode : TLabel;
    edtUserCode: TEdit;


  lblENTransportDepartmentTransportDepartmentName : TLabel;
  edtENTransportDepartmentTransportDepartmentName : TEdit;
  spbENTransportDepartmentTransportDepartment : TSpeedButton;
  

  HTTPRIOENTransportDep2User: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENTransportDepartmentTransportDepartmentClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENTransportDep2UserFilterEdit: TfrmENTransportDep2UserFilterEdit;
  ENTransportDep2UserFilterObj: ENTransportDep2UserFilter;

implementation

uses
  ShowENTransportDepartment
  ,ENTransportDepartmentController
;

{uses  
    EnergyproController, EnergyproController2, ENTransportDep2UserController  ;
}
{$R *.dfm}



procedure TfrmENTransportDep2UserFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtUserCode
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENTransportDep2UserObj.userCode <> Low(Integer) ) then
       edtUserCode.Text := IntToStr(ENTransportDep2UserObj.userCode)
    else
       edtUserCode.Text := '';


  end;

}

end;



procedure TfrmENTransportDep2UserFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENTransportDep2User: ENTransportDep2UserControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtUserCode.Text <> '' ) then
       ENTransportDep2UserFilterObj.userCode := StrToInt(edtUserCode.Text)
     else
       ENTransportDep2UserFilterObj.userCode := Low(Integer) ;
	   




  end;
end;

procedure TfrmENTransportDep2UserFilterEdit.spbENTransportDepartmentTransportDepartmentClick(Sender : TObject);
var 
   frmENTransportDepartmentShow: TfrmENTransportDepartmentShow;
begin
   frmENTransportDepartmentShow:=TfrmENTransportDepartmentShow.Create(Application,fmNormal);
   try
      with frmENTransportDepartmentShow do
        if ShowModal = mrOk then
        begin
            try
               if ENTransportDep2UserFilterObj.transportDepartment = nil then ENTransportDep2UserFilterObj.transportDepartment := ENTransportDepartment.Create();
               ENTransportDep2UserFilterObj.transportDepartment.code := StrToInt(GetReturnValue(sgENTransportDepartment,0));
               edtENTransportDepartmentTransportDepartmentName.Text:=GetReturnValue(sgENTransportDepartment,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENTransportDepartmentShow.Free;
   end;
end;





end.