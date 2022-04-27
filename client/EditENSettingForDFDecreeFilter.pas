
unit EditENSettingForDFDecreeFilter;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENSettingForDFDecreeController ;

type
  TfrmENSettingForDFDecreeFilterEdit = class(TDialogForm)

    lblDfDocTypeCode : TLabel;
    edtDfDocTypeCode: TEdit;

    lblDfDocTypeName : TLabel;
    edtDfDocTypeName: TEdit;

    lblCatalogCode : TLabel;
    edtCatalogCode: TEdit;

    lblCatalogName : TLabel;
    edtCatalogName: TMemo;

    lblDfDocPrefixCode : TLabel;
    edtDfDocPrefixCode: TEdit;

    lblDfDocPrefixName : TLabel;
    edtDfDocPrefixName: TEdit;

    lblPrefixSignerTabN : TLabel;
    edtPrefixSignerTabN: TEdit;

    lblPrefixSignerFio : TLabel;
    edtPrefixSignerFio: TEdit;

    lblPrefixSignerPostInfo : TLabel;
    edtPrefixSignerPostInfo: TEdit;

    lblInitiatorTabn : TLabel;
    edtInitiatorTabn: TEdit;

    lblInitiatorFio : TLabel;
    edtInitiatorFio: TEdit;

    lblInitiatorPodrName : TLabel;
    edtInitiatorPodrName: TMemo;

    lblInitiatorPodrCode : TLabel;
    edtInitiatorPodrCode: TEdit;

    lblDesignatedTabn : TLabel;
    edtDesignatedTabn: TEdit;

    lblDesignatedFio : TLabel;
    edtDesignatedFio: TEdit;

    lblDesignatedpostInfo : TLabel;
    edtDesignatedpostInfo: TEdit;



  HTTPRIOENSettingForDFDecree: THTTPRIO;

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
  frmENSettingForDFDecreeFilterEdit: TfrmENSettingForDFDecreeFilterEdit;
  ENSettingForDFDecreeFilterObj: ENSettingForDFDecreeFilter;

implementation


{uses  
    EnergyproController, EnergyproController2, ENSettingForDFDecreeController  ;
}
{$R *.dfm}



procedure TfrmENSettingForDFDecreeFilterEdit.FormShow(Sender: TObject);

begin

{ пока ниче не делать ...

  if (DialogState = dsInsert) or (DialogState = dsEdit) then
  begin
    DenyBlankValues([
      edtDfDocTypeCode
      ,edtDfDocTypeName
      ,edtCatalogCode
      ,edtCatalogName
      ,edtDfDocPrefixCode
      ,edtDfDocPrefixName
      ,edtPrefixSignerTabN
      ,edtPrefixSignerFio
      ,edtPrefixSignerPostInfo
      ,edtInitiatorTabn
      ,edtInitiatorFio
      ,edtInitiatorPodrName
      ,edtInitiatorPodrCode
      ,edtDesignatedTabn
      ,edtDesignatedFio
      ,edtDesignatedpostInfo
     ]);
   end;

  if  (DialogState = dsEdit) or (DialogState = dsView) then
  begin

    if ( ENSettingForDFDecreeObj.dfDocTypeCode <> Low(Integer) ) then
       edtDfDocTypeCode.Text := IntToStr(ENSettingForDFDecreeObj.dfDocTypeCode)
    else
       edtDfDocTypeCode.Text := '';



    edtDfDocTypeName.Text := ENSettingForDFDecreeObj.dfDocTypeName; 



    if ( ENSettingForDFDecreeObj.catalogCode <> Low(Integer) ) then
       edtCatalogCode.Text := IntToStr(ENSettingForDFDecreeObj.catalogCode)
    else
       edtCatalogCode.Text := '';



    MakeMultiline(edtCatalogName.Lines, ENSettingForDFDecreeObj.catalogName);



    if ( ENSettingForDFDecreeObj.dfDocPrefixCode <> Low(Integer) ) then
       edtDfDocPrefixCode.Text := IntToStr(ENSettingForDFDecreeObj.dfDocPrefixCode)
    else
       edtDfDocPrefixCode.Text := '';



    edtDfDocPrefixName.Text := ENSettingForDFDecreeObj.dfDocPrefixName; 



    edtPrefixSignerTabN.Text := ENSettingForDFDecreeObj.prefixSignerTabN; 



    edtPrefixSignerFio.Text := ENSettingForDFDecreeObj.prefixSignerFio; 



    edtPrefixSignerPostInfo.Text := ENSettingForDFDecreeObj.prefixSignerPostInfo; 



    edtInitiatorTabn.Text := ENSettingForDFDecreeObj.initiatorTabn; 



    edtInitiatorFio.Text := ENSettingForDFDecreeObj.initiatorFio; 



    MakeMultiline(edtInitiatorPodrName.Lines, ENSettingForDFDecreeObj.initiatorPodrName);



    if ( ENSettingForDFDecreeObj.initiatorPodrCode <> Low(Integer) ) then
       edtInitiatorPodrCode.Text := IntToStr(ENSettingForDFDecreeObj.initiatorPodrCode)
    else
       edtInitiatorPodrCode.Text := '';



    edtDesignatedTabn.Text := ENSettingForDFDecreeObj.designatedTabn; 



    edtDesignatedFio.Text := ENSettingForDFDecreeObj.designatedFio; 



    edtDesignatedpostInfo.Text := ENSettingForDFDecreeObj.designatedpostInfo; 


  end;

}

end;



procedure TfrmENSettingForDFDecreeFilterEdit.FormClose(Sender: TObject;  var Action: TCloseAction);
var TempENSettingForDFDecree: ENSettingForDFDecreeControllerSoapPort;
begin
  if (ModalResult = mrOk)  then
  begin

     if ( edtDfDocTypeCode.Text <> '' ) then
       ENSettingForDFDecreeFilterObj.dfDocTypeCode := StrToInt(edtDfDocTypeCode.Text)
     else
       ENSettingForDFDecreeFilterObj.dfDocTypeCode := Low(Integer) ;
	   



     ENSettingForDFDecreeFilterObj.dfDocTypeName := edtDfDocTypeName.Text; 



     if ( edtCatalogCode.Text <> '' ) then
       ENSettingForDFDecreeFilterObj.catalogCode := StrToInt(edtCatalogCode.Text)
     else
       ENSettingForDFDecreeFilterObj.catalogCode := Low(Integer) ;
	   



     ENSettingForDFDecreeFilterObj.catalogName := edtCatalogName.Text; 



     if ( edtDfDocPrefixCode.Text <> '' ) then
       ENSettingForDFDecreeFilterObj.dfDocPrefixCode := StrToInt(edtDfDocPrefixCode.Text)
     else
       ENSettingForDFDecreeFilterObj.dfDocPrefixCode := Low(Integer) ;
	   



     ENSettingForDFDecreeFilterObj.dfDocPrefixName := edtDfDocPrefixName.Text; 



     ENSettingForDFDecreeFilterObj.prefixSignerTabN := edtPrefixSignerTabN.Text; 



     ENSettingForDFDecreeFilterObj.prefixSignerFio := edtPrefixSignerFio.Text; 



     ENSettingForDFDecreeFilterObj.prefixSignerPostInfo := edtPrefixSignerPostInfo.Text; 



     ENSettingForDFDecreeFilterObj.initiatorTabn := edtInitiatorTabn.Text; 



     ENSettingForDFDecreeFilterObj.initiatorFio := edtInitiatorFio.Text; 



     ENSettingForDFDecreeFilterObj.initiatorPodrName := edtInitiatorPodrName.Text; 



     if ( edtInitiatorPodrCode.Text <> '' ) then
       ENSettingForDFDecreeFilterObj.initiatorPodrCode := StrToInt(edtInitiatorPodrCode.Text)
     else
       ENSettingForDFDecreeFilterObj.initiatorPodrCode := Low(Integer) ;
	   



     ENSettingForDFDecreeFilterObj.designatedTabn := edtDesignatedTabn.Text; 



     ENSettingForDFDecreeFilterObj.designatedFio := edtDesignatedFio.Text; 



     ENSettingForDFDecreeFilterObj.designatedpostInfo := edtDesignatedpostInfo.Text; 




  end;
end;




end.