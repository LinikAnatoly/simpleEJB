
unit EditENAutomatFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENAutomatController ;

type
  TfrmENAutomatFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblMarkCurrent : TLabel;
    edtMarkCurrent: TEdit;

    lblThermalSplitterCurrent : TLabel;
    edtThermalSplitterCurrent: TEdit;


  lblENAutomatTypeAutomatTypeName : TLabel;
  edtENAutomatTypeAutomatTypeName : TEdit;
  spbENAutomatTypeAutomatType : TSpeedButton;
  
  lblENElementElementName : TLabel;
  edtENElementElementName : TEdit;
  spbENElementElement : TSpeedButton;
  

  HTTPRIOENAutomat: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;
    lblCode: TLabel;
    edtCode: TEdit;
    edtEPRenName: TEdit;
    lblEPRenName: TLabel;
    spbEPRen: TSpeedButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbENAutomatTypeAutomatTypeClick(Sender : TObject);
  procedure spbENElementElementClick(Sender : TObject);
    procedure spbEPRenClick(Sender: TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENAutomatFilterEdit: TfrmENAutomatFilterEdit;
  ENAutomatFilterObj: ENAutomatFilter;

implementation

uses
  ShowENAutomatType
  ,ENAutomatTypeController
  ,ShowENElement
  ,ENElementController
, ENConsts, ShowENEPRen;

{uses  
    EnergyproController, EnergyproController2, ENAutomatController  ;
}
{$R *.dfm}



procedure TfrmENAutomatFilterEdit.FormShow(Sender: TObject);

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

    edtName.Text := ENAutomatObj.name; 



    if ( ENAutomatObj.markCurrent <> nil ) then
       edtMarkCurrent.Text := ENAutomatObj.markCurrent.decimalString
    else
       edtMarkCurrent.Text := ''; 



    if ( ENAutomatObj.thermalSplitterCurrent <> nil ) then
       edtThermalSplitterCurrent.Text := ENAutomatObj.thermalSplitterCurrent.decimalString
    else
       edtThermalSplitterCurrent.Text := ''; 


  end;

}

end;



procedure TfrmENAutomatFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENAutomat: ENAutomatControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENAutomatFilterObj.name := edtName.Text;


     if (edtCode.Text <> '') then
     ENAutomatFilterObj.code := StrToInt(edtCode.Text)
     else
     ENAutomatFilterObj.code := LOW_INT;



     if (ENAutomatFilterObj.markCurrent = nil ) then
       ENAutomatFilterObj.markCurrent := TXSDecimal.Create;
     if edtMarkCurrent.Text <> '' then
       ENAutomatFilterObj.markCurrent.decimalString := edtMarkCurrent.Text 
     else
       ENAutomatFilterObj.markCurrent := nil;




     if (ENAutomatFilterObj.thermalSplitterCurrent = nil ) then
       ENAutomatFilterObj.thermalSplitterCurrent := TXSDecimal.Create;
     if edtThermalSplitterCurrent.Text <> '' then
       ENAutomatFilterObj.thermalSplitterCurrent.decimalString := edtThermalSplitterCurrent.Text 
     else
       ENAutomatFilterObj.thermalSplitterCurrent := nil;





  end;
end;

procedure TfrmENAutomatFilterEdit.spbENAutomatTypeAutomatTypeClick(Sender : TObject);
var 
   frmENAutomatTypeShow: TfrmENAutomatTypeShow;
begin
   frmENAutomatTypeShow:=TfrmENAutomatTypeShow.Create(Application,fmNormal);
   try
      with frmENAutomatTypeShow do
        if ShowModal = mrOk then
        begin
            try
               if ENAutomatFilterObj.automatType = nil then ENAutomatFilterObj.automatType := ENAutomatType.Create();
               ENAutomatFilterObj.automatType.code := StrToInt(GetReturnValue(sgENAutomatType,0));
               edtENAutomatTypeAutomatTypeName.Text:=GetReturnValue(sgENAutomatType,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENAutomatTypeShow.Free;
   end;
end;


procedure TfrmENAutomatFilterEdit.spbENElementElementClick(Sender : TObject);
var 
   frmENElementShow: TfrmENElementShow;
begin
   frmENElementShow:=TfrmENElementShow.Create(Application,fmNormal);
   try
      with frmENElementShow do
        if ShowModal = mrOk then
        begin
            try
               if ENAutomatFilterObj.element = nil then ENAutomatFilterObj.element := ENElement.Create();
               ENAutomatFilterObj.element.code := StrToInt(GetReturnValue(sgENElement,0));
               edtENElementElementName.Text:=GetReturnValue(sgENElement,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmENElementShow.Free;
   end;
end;





procedure TfrmENAutomatFilterEdit.spbEPRenClick(Sender: TObject);
var
   frmEPRenShow: TfrmENEPRenShow;
begin
   frmEPRenShow:=TfrmENEPRenShow.Create(Application,fmNormal);
   try
      with frmEPRenShow do
        if ShowModal = mrOk then
        begin
            try
              if ENAutomatFilterObj.element = nil then ENAutomatFilterObj.element := ENElement.Create;
                  ENAutomatFilterObj.element.code := low_int;
               if ENAutomatFilterObj.element.renRef = nil then ENAutomatFilterObj.element.renRef := EPRenRef.Create();
               ENAutomatFilterObj.element.renRef.code  := StrToInt(GetReturnValue(sgEPRen,0));
               edtEPRenName.Text:=GetReturnValue(sgEPRen,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPRenShow.Free;
   end;
end;

end.