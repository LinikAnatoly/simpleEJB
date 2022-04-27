unit EditENSynchronizeMols;

interface

uses
    Windows, Messages, SysUtils, StdCtrls, Variants, Classes, Graphics, Controls, Forms,
    Dialogs, ChildFormUnit, InvokeRegistry, Rio, SOAPHTTPClient, ImgList,
    Grids, ComCtrls, ToolWin, Menus, ActnList, BaseGrid,  XSBuiltIns, GridHeadersUnit,
    DialogFormUnit, AdvGrid, Buttons,
	EnergyproController, EnergyproController2, ENMolController, TB2Item,
  TB2Dock, TB2Toolbar, AdvObj, HTMLabel, EditENSynchronizeMolsAddition ;
type
  TfrmSynchronizeMolsEdit = class(TDialogForm)
    htmlAttention: THTMLabel;
    btnOk: TButton;
    btnCancel: TButton;
    HTTPRIOENMol: THTTPRIO;
    ImageList1: TImageList;
    chbAddOSMols: TCheckBox;
    procedure FormClose(Sender: TObject; var Action: TCloseAction);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  frmSynchronizeMolsEdit: TfrmSynchronizeMolsEdit;

implementation

{$R *.dfm}

procedure TfrmSynchronizeMolsEdit.FormClose(Sender: TObject;
  var Action: TCloseAction);
var
  TempENMol : ENMolControllerSoapPort;
  molList : ENMolShortList;
  strMessageNewMols : String;
  frmSynchronizeMolsAddition : TfrmSynchronizeMolsAdditionEdit;
begin
  if (ModalResult = mrOk) then begin
      if Application.MessageBox(PChar('Ви дійсно бажаєте виконати синхронізацію?'),
                        PChar('Увага!'),MB_ICONQUESTION+MB_OKCANCEL+MB_DEFBUTTON2)=IDOK then
      begin
          TempENMol := HTTPRIOENMol as ENMolControllerSoapPort;
          molList := TempENMol.synchronizeMols(chbAddOSMols.Checked);
          if molList.totalCount > 0 then begin
            strMessageNewMols := 'Знайдено ' + IntToStr(molList.totalCount) + ' МОЛів, які відсутні у довіднику!';
                        Application.MessageBox(PChar(strMessageNewMols)
          , PChar('Повідомлення'), MB_ICONINFORMATION);
          frmSynchronizeMolsAddition := TfrmSynchronizeMolsAdditionEdit.Create(Application, dsView);
          frmSynchronizeMolsAddition.molList := molList;
          try
            frmSynchronizeMolsAddition.ShowModal;
          finally
            frmSynchronizeMolsAddition.Free;
          end;
          end;
          Application.MessageBox(PChar('Синхронізація була проведена успішно!')
          , PChar('Повідомлення'), MB_ICONINFORMATION);

      end else begin
        Action := caNone;
        Exit;
      end;
  end;
end;

end.
