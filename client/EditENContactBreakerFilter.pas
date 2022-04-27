
unit EditENContactBreakerFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENContactBreakerController ;

type
  TfrmENContactBreakerFilterEdit = class(TDialogForm)

    lblCurrent : TLabel;
    edtCurrent: TEdit;


  lblENContactBreakerTypeContactBreakerTypeName : TLabel;
  edtENContactBreakerTypeContactBreakerTypeName : TEdit;
  spbENContactBreakerTypeContactBreakerType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENContactBreaker: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENContactBreakerTypeContactBreakerTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENContactBreakerFilterEdit: TfrmENContactBreakerFilterEdit;
  ENContactBreakerFilterObj: ENContactBreakerFilter;

implementation

uses
  ShowENContactBreakerType
  ,ENContactBreakerTypeController
  ,ShowENElement
  ,ENElementController
;

{uses  
    EnergyproController, EnergyproController2, ENContactBreakerController  ;
}
{$R *.dfm}



procedure TfrmENContactBreakerFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtCurrent
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENContactBreakerObj.current <> nil ) then
       edtCurrent.Text := ENContactBreakerObj.current.decimalString
    else
       edtCurrent.Text := ''; 


  end;

}

end;



procedure TfrmENContactBreakerFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENContactBreaker: ENContactBreakerControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if (ENContactBreakerFilterObj.current = nil ) then
       ENContactBreakerFilterObj.current := TXSDecimal.Create;
     if edtCurrent.Text <> '' then
       ENContactBreakerFilterObj.current.decimalString := edtCurrent.Text 
     else
       ENContactBreakerFilterObj.current := nil;





  end;
end;

procedure TfrmENContactBreakerFilterEdit.spbENContactBreakerTypeContactBreakerTypeClick(Sender : TObject);
var 
   frmENContactBreakerTypeShow: TfrmENContactBreakerTypeShow;
begin
   frmENContactBreakerTypeShow:=TfrmENContactBreakerTypeShow.Create(Application,fmNormal);
   try
      with frmENContactBreakerTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContactBreakerFilterObj.contactBreakerType = nil then ENContactBreakerFilterObj.contactBreakerType := ENContactBreakerType.Create();
               ENContactBreakerFilterObj.contactBreakerType.code := StrToInt(GetReturnValue(sgENContactBreakerType,0));
               edtENContactBreakerTypeContactBreakerTypeName.Text:=GetReturnValue(sgENContactBreakerType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENContactBreakerTypeShow.Free;
   end;
end;


procedure TfrmENContactBreakerFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENContactBreakerFilterObj.element = nil then ENContactBreakerFilterObj.element := ENElement.Create();
               ENContactBreakerFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





end.