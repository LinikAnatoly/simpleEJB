
unit EditENFiderGuageFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENFiderGuageController ;

type
  TfrmENFiderGuageFilterEdit = class(TDialogForm)

    lblName : TLabel;
    edtName: TEdit;

    lblCurrentPhaseYellow : TLabel;
    edtCurrentPhaseYellow: TEdit;

    lblCurrentPhaseGreen : TLabel;
    edtCurrentPhaseGreen: TEdit;

    lblCurrentPhaseRed : TLabel;
    edtCurrentPhaseRed: TEdit;

    lblTensionPhaseYellow : TLabel;
    edtTensionPhaseYellow: TEdit;

    lblTensionPhaseGreen : TLabel;
    edtTensionPhaseGreen: TEdit;

    lblTensionPhaseRed : TLabel;
    edtTensionPhaseRed: TEdit;

    lblDateGuage : TLabel;
    edtDateGuage: TDateTimePicker;

  lblEPWorkerWorkerName : TLabel;
  edtEPWorkerWorkerName : TEdit;
  spbEPWorkerWorker : TSpeedButton;
  

  HTTPRIOENFiderGuage: THTTPRIO;

  btnOk: TButton;
  btnCancel: TButton;

  procedure FormShow(Sender: TObject);
  procedure FormClose(Sender: TObject; var Action: TCloseAction);
  
  procedure spbEPWorkerWorkerClick(Sender : TObject);

  private
    { Private declarations }
  public
    { Public declarations }

end;

var
  frmENFiderGuageFilterEdit: TfrmENFiderGuageFilterEdit;
  ENFiderGuageFilterObj: ENFiderGuageFilter;

implementation

uses
  ShowEPWorker
  //,EPWorkerController
;

{uses  
    EnergyproController, EnergyproController2, ENFiderGuageController  ;
}
{$R *.dfm}



procedure TfrmENFiderGuageFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtName
      ,edtCurrentPhaseYellow
      ,edtCurrentPhaseGreen
      ,edtCurrentPhaseRed
      ,edtTensionPhaseYellow
      ,edtTensionPhaseGreen
      ,edtTensionPhaseRed
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    edtName.Text := ENFiderGuageObj.name; 



    if ( ENFiderGuageObj.currentPhaseYellow <> nil ) then
       edtCurrentPhaseYellow.Text := ENFiderGuageObj.currentPhaseYellow.decimalString
    else
       edtCurrentPhaseYellow.Text := ''; 



    if ( ENFiderGuageObj.currentPhaseGreen <> nil ) then
       edtCurrentPhaseGreen.Text := ENFiderGuageObj.currentPhaseGreen.decimalString
    else
       edtCurrentPhaseGreen.Text := ''; 



    if ( ENFiderGuageObj.currentPhaseRed <> nil ) then
       edtCurrentPhaseRed.Text := ENFiderGuageObj.currentPhaseRed.decimalString
    else
       edtCurrentPhaseRed.Text := ''; 



    if ( ENFiderGuageObj.tensionPhaseYellow <> nil ) then
       edtTensionPhaseYellow.Text := ENFiderGuageObj.tensionPhaseYellow.decimalString
    else
       edtTensionPhaseYellow.Text := ''; 



    if ( ENFiderGuageObj.tensionPhaseGreen <> nil ) then
       edtTensionPhaseGreen.Text := ENFiderGuageObj.tensionPhaseGreen.decimalString
    else
       edtTensionPhaseGreen.Text := ''; 



    if ( ENFiderGuageObj.tensionPhaseRed <> nil ) then
       edtTensionPhaseRed.Text := ENFiderGuageObj.tensionPhaseRed.decimalString
    else
       edtTensionPhaseRed.Text := ''; 



      if ENFiderGuageObj.dateGuage <> nil then
      begin
        edtDateGuage.DateTime:=EncodeDate(ENFiderGuageObj.dateGuage.Year,ENFiderGuageObj.dateGuage.Month,ENFiderGuageObj.dateGuage.Day);
        edtDateGuage.checked := true;
      end
      else
      begin
        edtDateGuage.DateTime:=SysUtils.Date;
        edtDateGuage.checked := false;
      end;


  end;

}

end;



procedure TfrmENFiderGuageFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENFiderGuage: ENFiderGuageControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     ENFiderGuageFilterObj.name := edtName.Text; 



     if (ENFiderGuageFilterObj.currentPhaseYellow = nil ) then
       ENFiderGuageFilterObj.currentPhaseYellow := TXSDecimal.Create;
     if edtCurrentPhaseYellow.Text <> '' then
       ENFiderGuageFilterObj.currentPhaseYellow.decimalString := edtCurrentPhaseYellow.Text 
     else
       ENFiderGuageFilterObj.currentPhaseYellow := nil;




     if (ENFiderGuageFilterObj.currentPhaseGreen = nil ) then
       ENFiderGuageFilterObj.currentPhaseGreen := TXSDecimal.Create;
     if edtCurrentPhaseGreen.Text <> '' then
       ENFiderGuageFilterObj.currentPhaseGreen.decimalString := edtCurrentPhaseGreen.Text 
     else
       ENFiderGuageFilterObj.currentPhaseGreen := nil;




     if (ENFiderGuageFilterObj.currentPhaseRed = nil ) then
       ENFiderGuageFilterObj.currentPhaseRed := TXSDecimal.Create;
     if edtCurrentPhaseRed.Text <> '' then
       ENFiderGuageFilterObj.currentPhaseRed.decimalString := edtCurrentPhaseRed.Text 
     else
       ENFiderGuageFilterObj.currentPhaseRed := nil;




     if (ENFiderGuageFilterObj.tensionPhaseYellow = nil ) then
       ENFiderGuageFilterObj.tensionPhaseYellow := TXSDecimal.Create;
     if edtTensionPhaseYellow.Text <> '' then
       ENFiderGuageFilterObj.tensionPhaseYellow.decimalString := edtTensionPhaseYellow.Text 
     else
       ENFiderGuageFilterObj.tensionPhaseYellow := nil;




     if (ENFiderGuageFilterObj.tensionPhaseGreen = nil ) then
       ENFiderGuageFilterObj.tensionPhaseGreen := TXSDecimal.Create;
     if edtTensionPhaseGreen.Text <> '' then
       ENFiderGuageFilterObj.tensionPhaseGreen.decimalString := edtTensionPhaseGreen.Text 
     else
       ENFiderGuageFilterObj.tensionPhaseGreen := nil;




     if (ENFiderGuageFilterObj.tensionPhaseRed = nil ) then
       ENFiderGuageFilterObj.tensionPhaseRed := TXSDecimal.Create;
     if edtTensionPhaseRed.Text <> '' then
       ENFiderGuageFilterObj.tensionPhaseRed.decimalString := edtTensionPhaseRed.Text 
     else
       ENFiderGuageFilterObj.tensionPhaseRed := nil;




     if edtdateGuage.checked then
     begin 
       if ENFiderGuageFilterObj.dateGuage = nil then
          ENFiderGuageFilterObj.dateGuage := TXSDateTime.Create;
       ENFiderGuageFilterObj.dateGuage.XSToNative(GetXSDate(edtdateGuage.DateTime));
     end
     else
       ENFiderGuageFilterObj.dateGuage := nil;




  end;
end;

procedure TfrmENFiderGuageFilterEdit.spbEPWorkerWorkerClick(Sender : TObject);
var 
   frmEPWorkerShow: TfrmEPWorkerShow;
begin
   frmEPWorkerShow:=TfrmEPWorkerShow.Create(Application,fmNormal);
   try
      with frmEPWorkerShow do
        if ShowModal = mrOk then
        begin
            try
               if ENFiderGuageFilterObj.worker = nil then ENFiderGuageFilterObj.worker := EPWorker.Create();
               ENFiderGuageFilterObj.worker.code := StrToInt(GetReturnValue(sgMain,0));
               edtEPWorkerWorkerName.Text:=GetReturnValue(sgMain,1);
            except
               on EConvertError do Exit;
            end;
        end;
   finally
      frmEPWorkerShow.Free;
   end;
end;





end.